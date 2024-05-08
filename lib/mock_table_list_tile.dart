import 'package:flutter/material.dart';

class MockTableListTile extends StatelessWidget {
  const MockTableListTile(this.text, {super.key, this.textPadding = 12});

  final String text;
  final double textPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top:
              BorderSide(color: Color.fromARGB(255, 224, 224, 224), width: 2.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(textPadding),
        child: Text(text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
