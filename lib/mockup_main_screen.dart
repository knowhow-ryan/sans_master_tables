import 'package:flutter/material.dart';
import 'mock_table_group_panel.dart';

class MockupMainScreen extends StatelessWidget {
  const MockupMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SANS MASTER: TABLES',
            style: TextStyle(fontStyle: FontStyle.italic)),
        actions: <Widget>[
          //Hamburger menu
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu, size: 30))
        ],
        surfaceTintColor: Colors.white,
        shape: const ContinuousRectangleBorder(
            side: BorderSide(color: Colors.black)),
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
          const MockTableGroupPanel(),
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
