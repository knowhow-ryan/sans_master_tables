import 'package:flutter/material.dart';

enum SmUiUpDownIconDirection { up, down }

class SmUiUpDownIcon extends StatelessWidget {
  const SmUiUpDownIcon({super.key, required this.direction});

  final SmUiUpDownIconDirection direction;

  @override
  Widget build(BuildContext context) {
    IconData arrowIcon;
    switch (direction) {
      case SmUiUpDownIconDirection.down:
        arrowIcon = Icons.keyboard_arrow_down;
      case SmUiUpDownIconDirection.up:
        arrowIcon = Icons.keyboard_arrow_up;
    }

    return Icon(
      arrowIcon,
      size: 32,
      color: Colors.grey,
    );
  }
}
