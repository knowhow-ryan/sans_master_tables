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
      return Container(
        color: const Color.fromARGB(255, 196, 196, 196),
        child: Column(
          children: <Widget>[
            const MockOutcomeBorder(),
            const MockOutcomeSpinner(),
            MockHistoryPanelToggle(
              expanded: true,
              onPressed: () => setState(() => _expanded = !_expanded),
            ),
            const MockHistoryList(),
          ],
        ),
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
        MockOutomeSpinnerTile(
          location: MockOutcomeSpinnerTileLocation.top,
          resultText: 'RESULT -1',
          backgroundColor: Colors.grey,
        ),
        MockOutomeSpinnerTile(
          location: MockOutcomeSpinnerTileLocation.middle,
          resultText: 'RESULT',
          backgroundColor: Color.fromARGB(255, 189, 189, 189),
        ),
        MockOutomeSpinnerTile(
          location: MockOutcomeSpinnerTileLocation.bottom,
          resultText: 'RESULT +1',
          backgroundColor: Colors.grey,
        ),
      ],
    );
  }
}

class MockOutomeSpinnerTile extends StatelessWidget {
  const MockOutomeSpinnerTile({
    required this.resultText,
    required this.backgroundColor,
    required this.location,
    super.key,
  });

  final String resultText;
  final Color backgroundColor;
  final MockOutcomeSpinnerTileLocation location;

  @override
  Widget build(BuildContext context) {
    double skew = 1.0;
    switch (location) {
      case MockOutcomeSpinnerTileLocation.top:
        skew = 1 * skew;
      case MockOutcomeSpinnerTileLocation.middle:
        skew = 0 * skew;
      case MockOutcomeSpinnerTileLocation.bottom:
        skew = -1 * skew;
    }

    return Container(
      color: backgroundColor,
      width: MediaQuery.of(context).size.width,
      child: Align(
        alignment: Alignment.center,
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(skew),
          child: Text(
            resultText,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

enum MockOutcomeSpinnerTileLocation { top, middle, bottom }

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
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide()),
              color: Colors.white,
            ),
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
    return Container(
      color: const Color.fromARGB(255, 196, 196, 196),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return MockHistoryTile(
            outcomeText: historyStrings[index],
            outcomeTime: historyTimeStamps[index],
          );
        },
      ),
    );
  }
}

List historyStrings = [
  "YES BUT,",
  "SPICY, TOLERANT, GREASY",
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

class MockHistoryTile extends StatelessWidget {
  const MockHistoryTile(
      {required this.outcomeText, required this.outcomeTime, super.key});

  final String outcomeText;
  final String outcomeTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 196, 196, 196),
      child: Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 4.0),
              child: Text(
                outcomeText,
                style:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    outcomeTime,
                    style: const TextStyle(fontSize: 10),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MockOutcomeBorder extends StatelessWidget {
  const MockOutcomeBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 8, child: Container(color: Colors.black));
  }
}
