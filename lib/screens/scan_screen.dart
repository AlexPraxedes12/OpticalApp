import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import '../tflite_classifier.dart';
import '../translations.dart';

import 'result_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen>
    with SingleTickerProviderStateMixin {
  bool _loading = false;
  late Future<TFLiteClassifier> _classifierFuture;
  CameraController? _cameraController;
  late Future<void> _cameraInitFuture;
  List<CameraDescription> _cameras = [];
  int _selectedCameraIndex = 0;
  late AnimationController _pulseController;
  int? _countdown;
  FlashMode _flashMode = FlashMode.off;

  @override
  void initState() {
    super.initState();
    _classifierFuture = TFLiteClassifier.create();
    _cameraInitFuture = _initCamera();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _initCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) return;

      // Default to the front camera if available
      final frontIndex =
          _cameras.indexWhere((c) => c.lensDirection == CameraLensDirection.front);
      _selectedCameraIndex = frontIndex >= 0 ? frontIndex : 0;

      _cameraController = CameraController(
        _cameras[_selectedCameraIndex],
        ResolutionPreset.medium,
        enableAudio: false,
      );
      await _cameraController!.initialize();
      _flashMode = FlashMode.off;
      await _cameraController!.setFlashMode(_flashMode);
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint('Camera initialization failed: $e');
    }
  }

  Future<void> _switchCamera() async {
    if (_cameras.length < 2) return;
    final newIndex = (_selectedCameraIndex + 1) % _cameras.length;
    try {
      await _cameraController?.dispose();
      _cameraController = CameraController(
        _cameras[newIndex],
        ResolutionPreset.medium,
        enableAudio: false,
      );
      _selectedCameraIndex = newIndex;
      await _cameraController!.initialize();
      _flashMode = FlashMode.off;
      await _cameraController!.setFlashMode(_flashMode);
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint('Camera switch failed: $e');
    }
  }

  Future<void> _toggleFlash() async {
    if (_cameraController == null) return;
    _flashMode =
        _flashMode == FlashMode.off ? FlashMode.torch : FlashMode.off;
    try {
      await _cameraController!.setFlashMode(_flashMode);
      if (mounted) setState(() {});
    } catch (e) {
      debugPrint('Flash toggle failed: $e');
    }
  }

  Future<void> _classifyImage(String path, String lang) async {
    setState(() {
      _loading = true;
    });
    _pulseController.repeat(reverse: true);
    try {
      final classifier = await _classifierFuture;
      final predictions =
          (await classifier.classify(File(path))).take(5).toList();
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            imagePath: path,
            predictions: predictions,
            summary: 'No explanation available.',
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
        _pulseController.stop();
      }
    }
  }

  Future<void> _pickFromGallery(BuildContext context, String lang) async {
    if (_loading) return;
    XFile? pickedFile;
    try {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    } on Exception {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(tr('permissionDenied', lang))));
      }
    }

    if (pickedFile == null) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(tr('noImage', lang))));
      }
      return;
    }

    await _classifyImage(pickedFile.path, lang);
  }

  Future<void> _startCountdownAndCapture(BuildContext context, String lang) async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    for (var i = 3; i > 0; i--) {
      if (!mounted) return;
      setState(() {
        _countdown = i;
      });
      await Future.delayed(const Duration(seconds: 1));
    }
    if (!mounted) return;
    setState(() {
      _countdown = null;
    });
    final XFile picture = await _cameraController!.takePicture();
    if (!mounted) return;
    final keep = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Image.file(File(picture.path)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(tr('retakePhoto', lang)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(tr('keepPhoto', lang)),
          ),
        ],
      ),
    );
    if (keep == true) {
      await _classifyImage(picture.path, lang);
    } else if (keep == false) {
      await _startCountdownAndCapture(context, lang);
    }
  }

  Future<void> _scanImage(BuildContext context, String lang) async {
    if (_loading) return;
    await _startCountdownAndCapture(context, lang);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: currentLanguage,
      builder: (context, lang, _) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'EyeScan',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
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
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.key,
                                child: Text(e.value),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FutureBuilder(
                future: _cameraInitFuture,
                builder: (context, snapshot) {
                  final size = MediaQuery.of(context).size.width * 0.7;
                  if (snapshot.connectionState == ConnectionState.done &&
                      _cameraController != null &&
                      _cameraController!.value.isInitialized) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipOval(
                          child: SizedBox(
                            width: size,
                            height: size,
                            child: CameraPreview(_cameraController!),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _pulseController,
                          builder: (context, child) {
                            return Container(
                              width: size,
                              height: size,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.1),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.8),
                                  width: 4 + 2 * _pulseController.value,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        if (_countdown != null)
                          Text(
                            '$_countdown',
                            style: const TextStyle(
                              fontSize: 72,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: IconButton(
                            tooltip: _flashMode == FlashMode.torch
                                ? tr('flashOff', lang)
                                : tr('flashOn', lang),
                            icon: Icon(
                              _flashMode == FlashMode.torch
                                  ? Icons.flash_on
                                  : Icons.flash_off,
                              color: Colors.white,
                            ),
                            onPressed: _toggleFlash,
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: IconButton(
                            icon: const Icon(Icons.cameraswitch,
                                color: Colors.white),
                            onPressed: _switchCamera,
                          ),
                        ),
                      ],
                    );
                  }
                  return Container(
                    width: size,
                    height: size,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Center(child: Text(tr('cameraPreview', lang))),
                  );
                },
              ),
              const SizedBox(height: 16),
              Text(
                tr('alignText', lang),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              Text(
                tr('lightingTip', lang),
                style: const TextStyle(fontSize: 14, color: Colors.black45),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton(
                  onPressed:
                      _loading ? null : () => _pickFromGallery(context, lang),
                  style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    tr('chooseGallery', lang),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _loading ? null : () => _scanImage(context, lang),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.blueAccent,
                    elevation: 6,
                    shadowColor: Colors.black45,
                  ),
                  child: _loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          tr('scan', lang),
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
