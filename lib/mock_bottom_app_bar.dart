import 'package:flutter/material.dart';

class MockBottomAppBar extends StatelessWidget {
  const MockBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //QUICK ROLL BUTTONS
      height: 120,
      padding: const EdgeInsets.all(0),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Container(
        decoration: const BoxDecoration(border: Border(top: BorderSide())),
        padding: const EdgeInsets.all(3),
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      MockQuickRollButton(
                        onPressed: () {},
                        alignment: Alignment.centerLeft,
                        text: "QUICK ROLL #1",
                      ),
                      MockQuickRollButton(
                        onPressed: () {},
                        alignment: Alignment.centerLeft,
                        text: "QUICK ROLL #3",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      MockQuickRollButton(
                        onPressed: () {},
                        alignment: Alignment.centerRight,
                        text: "QUICK ROLL #2",
                      ),
                      MockQuickRollButton(
                        onPressed: () {},
                        alignment: Alignment.centerRight,
                        text: "QUICK ROLL #4",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const MockOracleButton(),
          ],
        ),
      ),
    );
  }
}

class MockQuickRollButton extends StatelessWidget {
  const MockQuickRollButton({
    required this.text,
    required this.onPressed,
    required this.alignment,
    super.key,
  });

  final String text;
  final void Function() onPressed;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.all(3),
          alignment: alignment,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: const Color.fromARGB(255, 196, 196, 196),
          ),
          child: Text(text,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class MockOracleButton extends StatelessWidget {
  const MockOracleButton({super.key});

  @override
  Widget build(BuildContext context) {
    double outerSize = 140;
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        width: outerSize,
        height: outerSize,
        padding: const EdgeInsets.all(6),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 196, 196, 196),
              border: Border.all(color: Colors.grey),
            ),
            child: const Center(
                child: Text(
              "ASK THE ORACLE",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
