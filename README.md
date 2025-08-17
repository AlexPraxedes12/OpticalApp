# OpticalApp — Accessible AI-Powered Eye Disease Detection + DIY Fundus Adapter

<p align="center">
  <img src="./sano.jpg" alt="Healthy eye screenshot" width="300"/>
  <img src="./anomalo.jpg" alt="Anomalous eye screenshot" width="300"/>
</p>

🎥 **Watch the video demo**  
[![Video Presentation](https://img.youtube.com/vi/UjFPXKP18SA/hqdefault.jpg)](https://youtu.be/UjFPXKP18SA)

📦 **APK Download**  
Download the latest version of the app from the [GitHub Releases](https://github.com/AlexPraxedes12/OpticalApp/releases). Test using your own fundus images or the ones in `testing_images/`.

## App Features
- EfficientNet‑B0 trained on the RFMiD dataset (28+ diseases)
- Runs fully offline via TensorFlow Lite
- Multilingual interface (English, Spanish, French)
- Text‑to‑Speech explanations
- Accepts camera capture and gallery input

## DIY Fundus Adapter

### Option A — Cardboard Tube Adapter (with or without 20D)
- Recycled cardboard tube aligned with the phone camera
- LED (phone's or small external) + simple paper diffuser
- Works with or without a 20D lens
- Approximate cost: **MXN $10**
*Add image here (assembled adapter / 3D render).*

### Option B — 3D‑Printed Adapter
- Modular 3D‑printed shell for alignment and stability
- Built to hold an LED + diffuser and optionally a 20D lens
- Approximate cost: **MXN $150**
*Add image here (assembled adapter / 3D render).*

#### Electrical schematic

<img src="./assets/circuit_led_switch.svg" alt="LED + switch + battery circuit" width="720" />

*Note: Both adapters can be adapted to secure a 20D ophthalmic lens. If you don't have one, the designs still work using only the phone optics.*

### 3D Model Files
- [`./3D_model/model.stl`](./3D_model/model.stl)  
- [`./3D_model/scad_funcional.scad`](./3D_model/scad_funcional.scad)  
Use any 3D viewer or a Three.js viewer to explore the models before printing.

## Illumination & Diffuser
A small LED paired with a thin white diffuser provides uniform retinal illumination while minimizing glare. Adjust the angle and distance to avoid reflections when capturing images.

## Cost Summary

| Adapter Option | Estimated Cost |
|----------------|----------------|
| Option A — Cardboard Tube | MXN $10 |
| Option B — 3D‑Printed | MXN $150 |

## Technical Overview
- Built with Flutter
- EfficientNet‑B0 model on RFMiD
- Offline inference with TensorFlow Lite
- Multilingual support & TTS
- Supports camera and gallery input

## Disclaimer
OpticalApp is an educational tool and is **not** a substitute for professional medical diagnosis or treatment. Always consult a qualified eye-care professional.

## Roadmap & Contributing
- Collect more mobile‑captured training images  
- Refine adapter designs and illumination  
- Expand platform support (iOS, web)  
- Add clinical validation and referral workflows  

Contributions and issues are welcome!

## License
Released under the MIT License.
