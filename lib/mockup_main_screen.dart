import 'package:flutter/material.dart';
import 'package:sans_master_tables/mock_outcome_display.dart';
import 'mock_table_group_panel.dart';
import 'mock_bottom_app_bar.dart';

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
      bottomNavigationBar: const MockBottomAppBar(),
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
