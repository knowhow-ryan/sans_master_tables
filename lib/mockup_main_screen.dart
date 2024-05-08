import 'package:flutter/material.dart';
import 'package:sans_master_tables/mock_outcome_display.dart';
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
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MockTableGroupPanel(),
          MockOutcomeDisplay(
            initializeExpanded: true,
          ),
        ],
      ),
    );
  }
}
