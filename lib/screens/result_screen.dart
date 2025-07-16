import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../condition_details.dart';
import '../translations.dart';

class ResultScreen extends StatefulWidget {
  final String imagePath;
  final List<Map<String, dynamic>> predictions;
  final String summary;

  const ResultScreen({
    super.key,
    required this.imagePath,
    required this.predictions,
    required this.summary,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final FlutterTts _flutterTts = FlutterTts();
  bool _speaking = false;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _initTts();
    currentLanguage.addListener(_updateTtsLanguage);
  }

  Future<void> _initTts() async {
    await _flutterTts.awaitSpeakCompletion(true);
    await _updateTtsLanguage();
  }

  Future<void> _updateTtsLanguage() async {
    await _flutterTts.setLanguage(
        ttsLocales[currentLanguage.value] ?? 'en-US');
    await _flutterTts.setVolume(1.0);
  }

  String _joinNatural(List<String> items, String lang) {
    final translated = items.map((e) => trSymptom(e, lang)).toList();
    if (translated.isEmpty) return '';
    if (translated.length == 1) return translated.first;
    if (translated.length == 2) {
      return '${translated.first} ${tr('and', lang)} ${translated.last}';
    }
    final last = translated.removeLast();
    return '${translated.join(', ')} ${tr('and', lang)} $last';
  }

  Future<void> _speakExplanation(String lang) async {
    setState(() {
      _speaking = true;
    });
    try {
      if (widget.predictions.isEmpty) {
        await _flutterTts.speak(tr('noInfo', lang));
        return;
      }
      await _flutterTts.stop();
      final locale = ttsLocales[lang] ?? 'en-US';
      await _flutterTts.setLanguage(locale);
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);

      final index = _selectedIndex.clamp(0, widget.predictions.length - 1);
      final prediction = widget.predictions[index];
      final code = prediction['disease']?.toString().trim() ?? '';
      debugPrint('Speaking $code using locale $locale');
      final details = getConditionDetails(code, lang);
      if (details == null) {
        await _flutterTts.speak(tr('noInfo', lang));
        return;
      }

      final name = details['name'] as String? ?? code;
      final desc = (details['description'] as String?) ?? '';
      final symptoms =
          (details['symptoms'] as List<dynamic>? ?? []).cast<String>();
      final hasInfo = desc.isNotEmpty || symptoms.isNotEmpty;

      if (!hasInfo) {
        await _flutterTts.speak('$name. ${tr('noInfo', lang)}');
        return;
      }

      final symptomList = _joinNatural(symptoms, lang);
      final symptomText = symptomList.isEmpty
          ? ''
          : ' ${tr('symptoms', lang)} $symptomList.';
      final text = '$name. ' +
          (desc.isEmpty ? tr('noDescription', lang) : desc) +
          symptomText;

      await _flutterTts.speak(text);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(tr('ttsError', lang))),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _speaking = false;
        });
      } else {
        _speaking = false;
      }
    }
  }

  @override
  void dispose() {
    _flutterTts.stop();
    currentLanguage.removeListener(_updateTtsLanguage);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: currentLanguage,
      builder: (context, lang, _) {
        final index = widget.predictions.isNotEmpty
            ? _selectedIndex.clamp(0, widget.predictions.length - 1)
            : 0;
        final prediction =
            widget.predictions.isNotEmpty ? widget.predictions[index] : null;
        final code = prediction?['disease']?.toString().trim() ?? '';
        final prob = (prediction?['probability'] as num?) ?? 0;
        final details = getConditionDetails(code, lang);
        final name = details?['name'] as String? ?? code;
        final description = details?['description'] as String?;
        final symptoms =
            (details?['symptoms'] as List<dynamic>? ?? []).cast<String>();

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      const BackButton(),
                      const Spacer(),
                      ValueListenableBuilder<String>(
                        valueListenable: currentLanguage,
                        builder: (context, lang, _) {
                          return DropdownButton<String>(
                            value: lang,
                            underline: const SizedBox.shrink(),
                            onChanged: (val) {
                              if (val != null) currentLanguage.value = val;
                            },
                            items: supportedLanguages.entries
                                .map((e) => DropdownMenuItem(
                                      value: e.key,
                                      child: Text(e.value),
                                    ))
                                .toList(),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(widget.imagePath),
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (widget.predictions.isNotEmpty) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        tr('topPredictions', lang),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    for (var i = 0;
                        i <
                            (widget.predictions.length < 3
                                ? widget.predictions.length
                                : 3);
                        i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = i;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Builder(builder: (context) {
                            final p = widget.predictions[i];
                            final code = p['disease']?.toString().trim() ?? '';
                            final pr = (p['probability'] as num?) ?? 0;
                            final det = getConditionDetails(code, lang);
                            final n = det?['name'] as String? ?? code;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('${i + 1}.'),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        n,
                                        style: TextStyle(
                                          fontWeight: i == _selectedIndex
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Text('${(pr * 100).toStringAsFixed(2)}%'),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                LinearProgressIndicator(
                                  value: pr.toDouble().clamp(0.0, 1.0),
                                  backgroundColor: Colors.grey.shade300,
                                  valueColor:
                                      const AlwaysStoppedAnimation(Colors.blueAccent),
                                  minHeight: 6,
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    const SizedBox(height: 16),
                  ]
                  else ...[
                    Text(tr('noPredictions', lang)),
                    const SizedBox(height: 16),
                  ],
                  Expanded(
                    child: SingleChildScrollView(
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('${(prob * 100).toStringAsFixed(2)}%'),
                              const SizedBox(height: 8),
                              Text(
                                description?.isNotEmpty == true
                                    ? description!
                                    : tr('noInfo', lang),
                              ),
                              if (symptoms.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text(
                                  tr('symptoms', lang),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                for (var s in symptoms)
                                  Text('• ${trSymptom(s, lang)}'),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _speaking ? null : () => _speakExplanation(lang),
                  icon: _speaking
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Icon(Icons.volume_up),
                  label: Text(
                    tr('readAloud', lang),
                    style: const TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text(
                    tr('scanAgain', lang),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      );
    },
  );
  }

}
