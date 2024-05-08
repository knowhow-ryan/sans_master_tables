import 'package:flutter/material.dart';

class MockOutcomeDisplay extends StatefulWidget {
  const MockOutcomeDisplay({this.initializeExpanded = false, super.key});

  final bool initializeExpanded;

  @override
  State<StatefulWidget> createState() => _MockOutcomeDisplayState();
}

class _MockOutcomeDisplayState extends State<MockOutcomeDisplay> {
  bool _expanded = false; //TODO: replace with a global UiState value eventually

  @override
  void initState() {
    super.initState();
    _expanded = widget.initializeExpanded;
  }

  @override
  Widget build(BuildContext context) {
    if (_expanded) {
      return Column(
        children: <Widget>[
          const MockOutcomeBorder(),
          const MockOutcomeSpinner(),
          MockHistoryPanelToggle(
            expanded: true,
            onPressed: () => setState(() => _expanded = !_expanded),
          ),
          const MockHistoryList(),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          MockHistoryPanelToggle(
              expanded: false,
              onPressed: () => setState(() => _expanded = !_expanded)),
          const MockOutcomeSpinner(),
          const MockOutcomeBorder(),
        ],
      );
    }
  }
}

class MockOutcomeSpinner extends StatelessWidget {
  const MockOutcomeSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      //TABLE SPINNER
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('RESULT -1'),
        Text('RESULT'),
        Text('RESULT +1'),
      ],
    );
  }
}

class MockHistoryPanelToggle extends StatelessWidget {
  const MockHistoryPanelToggle(
      {this.expanded = false, required this.onPressed, super.key});

  final bool expanded;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          //HISTORY DRAGGABLE TOP BOUNDARY
          height: 24,
          child: Container(
            decoration:
                const BoxDecoration(border: Border(bottom: BorderSide())),
          ),
        ),
        Align(
          //HISTORY DRAGGABLE TOP BOUNDARY ICON
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: expanded
                  ? const Border(bottom: BorderSide())
                  : const Border(top: BorderSide()),
            ),
            child: IconButton(
              onPressed: onPressed,
              iconSize: 24,
              icon: expanded
                  ? const Icon(Icons.arrow_downward)
                  : const Icon(Icons.arrow_upward),
            ),
          ),
        ),
      ],
    );
  }
}

class MockHistoryList extends StatelessWidget {
  const MockHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(historyStrings[index]),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[Text(historyTimeStamps[index])],
            ),
          ],
        );
      },
    );
  }
}

List historyStrings = [
  "YES BUT,",
  "SPICE, TOLERANT, GREASY",
  "HUMAN, CARPENTER, TIRED",
  "NO AND,",
  "10"
];
List historyTimeStamps = [
  "3:04 PM",
  "3:05 PM",
  "3:05 PM",
  "3:06 PM",
  "3:08 PM"
];

class MockOutcomeBorder extends StatelessWidget {
  const MockOutcomeBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 8, child: Container(color: Colors.black));
  }
}
