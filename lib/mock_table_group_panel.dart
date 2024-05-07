import 'package:flutter/material.dart';

class MockTableGroupPanel extends StatelessWidget {
  const MockTableGroupPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: Row(
            //Table List Title Bar
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
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
                mainAxisAlignment: MainAxisAlignment.end,
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
      ],
    );
  }
}
