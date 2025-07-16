import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/services.dart' show rootBundle;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class TFLiteClassifier {
  late final Interpreter _interpreter;
  late final List<String> _labels;
  final int inputSize;

  /// Applies softmax to raw model output so values are valid probabilities.
  List<double> _applySoftmax(List<double> logits) {
    final expScores = logits.map((x) => math.exp(x)).toList();
    final sum = expScores.reduce((a, b) => a + b);
    return expScores.map((x) => x / sum).toList();
  }

  TFLiteClassifier._(this._interpreter, this._labels, this.inputSize);

  static Future<TFLiteClassifier> create({
    String modelPath = 'assets/model_float32.tflite',
    String labelPath = 'assets/labels.txt',
    int inputSize = 224,
  }) async {
    final interpreter = await Interpreter.fromAsset(modelPath);
    final labelsData = await rootBundle.loadString(labelPath);
    final labels = labelsData
        .split('\n')
        .where((element) => element.trim().isNotEmpty)
        .toList();
    return TFLiteClassifier._(interpreter, labels, inputSize);
  }

  Future<List<Map<String, dynamic>>> classify(File image) async {
    final bytes = await image.readAsBytes();
    final img.Image? baseImage = img.decodeImage(bytes);
    if (baseImage == null) return [];
    final img.Image resized = img.copyResize(
      baseImage,
      width: inputSize,
      height: inputSize,
    );

    final input = List.generate(
      1,
      (_) => List.generate(
        inputSize,
        (y) => List.generate(inputSize, (x) {
          final pixel = resized.getPixel(x, y);
          return [pixel.r / 255.0, pixel.g / 255.0, pixel.b / 255.0];
        }),
      ),
    );

    final output = List.generate(1, (_) => List.filled(_labels.length, 0.0));

    _interpreter.run(input, output);

    // Normalize logits using softmax so they represent probabilities.
    final logits = List<double>.from(output[0]);
    final probabilities = _applySoftmax(logits);

    final results = <Map<String, dynamic>>[];
    for (int i = 0; i < _labels.length; i++) {
      results.add({
        'disease': _labels[i],
        'probability': probabilities[i],
      });
    }

    results.sort(
      (a, b) =>
          (b['probability'] as double).compareTo(a['probability'] as double),
    );
    return results;
  }
}
