import 'package:flutter/material.dart';
import 'smui_up_down_icon.dart';
import 'mock_table_list_tile.dart';

class MockTableGroupPanel extends StatelessWidget {
  const MockTableGroupPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 196, 196, 196), width: 1.0))),
          child: Row(
            //Table List Title Bar
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                //TABLE GROUP TITLE
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      'ALL TABLES',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const SmUiUpDownIcon(
                        direction: SmUiUpDownIconDirection.down),
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
                    icon: const SmUiUpDownIcon(
                        direction: SmUiUpDownIconDirection.down),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      'A-Z',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ListView.builder(
          //TABLE GROUP LIST
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            String tileText = "ERROR";
            if (index < 4) {
              tileText = "TABLE NAME ${index + 1}";
            } else {
              tileText = "REALLY ANNOYINGLY LONG....";
            }
            return MockTableListTile(tileText);
          },
        ),
      ],
    );
  }
}
