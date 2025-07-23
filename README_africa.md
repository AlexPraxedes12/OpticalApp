# OpticalApp – Offline AI Ocular Diagnosis for Rural Africa

## 🩺 Context
In many African regions, particularly rural areas, access to ophthalmologists is extremely limited. Preventable vision loss remains a major health challenge due to lack of early screening tools.

## 💡 Our Solution
**OpticalApp** is a mobile application that uses on-device artificial intelligence to detect eye diseases from fundus images — entirely **offline**. Combined with a DIY $0.50 phone adapter, it enables early screening without any internet connection or expensive equipment.

### Features
- Offline AI diagnosis using EfficientNet-B0 and TensorFlow Lite
- DIY adapter made with cardboard and a magnifying lens
- Voice assistant to read results aloud
- Multilingual interface (English, French, Spanish)
- Works on Android smartphones

## 🚀 How It Works
1. The user captures a fundus photo with the smartphone and adapter or selects one from the gallery.
2. `TFLiteClassifier` (see [`lib/tflite_classifier.dart`](lib/tflite_classifier.dart)) loads `assets/model_float32.tflite` and the label file `assets/labels.txt` at startup. The model was trained on the RFMiD dataset to recognise 29 ocular conditions.
3. Images are resized to 224×224 pixels, normalized to `[0,1]` and passed to the TensorFlow Lite interpreter. Softmax probabilities are calculated and the top predictions are sorted.
4. `ScanScreen` displays a countdown and handles image capture. The predictions are then passed to `ResultScreen`, which cross‑references [`condition_details.dart`](lib/condition_details.dart) to display the disease name, description and symptoms in the selected language.
5. Pressing **Read Aloud** triggers the `FlutterTts` plugin to speak the explanation.

Everything runs locally on the device—no network connection is needed once the APK is installed.

## 🌍 Why It Matters in Africa
- Designed for remote, low-resource regions.
- Requires only a low-cost adapter and an Android phone.
- Can be used by community health workers with minimal training.

## Folder Structure
```
lib/                     Flutter source code
  ├── main.dart          App entry point
  ├── screens/           UI screens (scan & result)
  ├── tflite_classifier.dart  Image classification logic
  ├── translations.dart  Multilingual texts
  └── condition_details.dart  Disease information
assets/                  TensorFlow Lite models and labels
model_training/          Training scripts and notebooks
testing_images/          Sample fundus images for demos
```

## Installation
### Requirements
- Flutter 3.8 or newer
- Android SDK (API 21+) with a connected device or emulator

### Steps
1. Clone the repository and fetch dependencies:
   ```bash
   git clone https://github.com/AlexPraxedes12/OpticalApp.git
   cd OpticalApp
   flutter pub get
   ```
2. Run on a connected Android device:
   ```bash
   flutter run
   ```
   Or build a release APK:
   ```bash
   flutter build apk --release
   ```
3. Optionally, download the prepared APK from the [Releases](https://github.com/AlexPraxedes12/OpticalApp/releases) page and sideload it.

## System Requirements
A modern Android smartphone with at least 2 GB of RAM is recommended. Once installed, the app works offline.

## 📦 APK Download
[Insert APK link]

## 📸 Demo
[Insert YouTube link]

## Further Improvements
- Add more mobile-captured training data
- Refine the phone adapter design
- Extend support to additional African languages

*This project is for educational and research purposes and is not a certified medical device.*
