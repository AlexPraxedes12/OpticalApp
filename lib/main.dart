import 'package:flutter/material.dart';
import 'screens/scan_screen.dart';
import 'translations.dart';

void main() => runApp(const OptiScanApp());

class OptiScanApp extends StatelessWidget {
  const OptiScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: currentLanguage,
      builder: (context, lang, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'OptiScan',
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'SF Pro Display',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          ),
          home: const ScanScreen(),
        );
      },
    );
  }
}
