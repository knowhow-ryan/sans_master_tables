import 'package:flutter/material.dart';
import 'mockup_main_screen.dart';

void main() {
  runApp(const TablesApp());
}

class TablesApp extends StatelessWidget {
  const TablesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MockupMainScreen(),
    );
  }
}
