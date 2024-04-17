import 'package:flutter/material.dart';

class MockupMainScreen extends StatelessWidget {
  const MockupMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sans Master: Tables'),
        actions: <Widget>[
          //Hamburger menu
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        //QUICK ROLL BUTTONS
        height: 120,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: const Text("QUICK ROLL #1"),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("QUICK ROLL #3"),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: const Text("QUICK ROLL #2"),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text("QUICK ROLL #4"),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 5,
        child: const Text("ASK THE\nORACLE"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            //Table List Title Bar
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('ALL TABLES'), //TABLE GROUP TITLE
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
              Row(
                //FILTERING/ORDERING BUTTON
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                  const Text('A-Z'),
                ],
              ),
            ],
          ),
          ListView.builder(
            //TABLE LIST
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              Widget tableTile = const Text('ERROR');
              if (index < 4) {
                tableTile = Text('TABLE NAME ${index + 1}');
              } else {
                tableTile = const Text('REALLY ANNOYINGLY LONG....');
              }
              return tableTile;
            },
          ),
          const Column(
            //TABLE SPINNER
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('RESULT -1'),
              Text('RESULT'),
              Text('RESULT +1'),
            ],
          ),
          Stack(
            //HISTORY PANEL
            children: <Widget>[
              ListView.builder(
                //HISTORY LIST
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
              ),
              SizedBox(
                  //HISTORY DRAGGABLE TOP BOUNDARY
                  height: 25,
                  child: Container(
                      color: const Color.fromARGB(158, 158, 158, 158))),
              Align(
                //HISTORY DRAGGABLE TOP BOUNDARY ICON
                alignment: Alignment.topCenter,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_downward),
                ),
              ),
            ],
          ),
        ],
      ),
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
