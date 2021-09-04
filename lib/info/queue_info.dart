import 'package:flutter/material.dart';

import 'package:data_structures/helper/functions.dart';

class QueueInfo extends StatelessWidget {

  final List<String> list = [
    'Red color denotes data in the "Front" position',
    'Blue color denotes data in the "Rear" position',
    'Enqueue inserts data in the Rear position of the Queue',
    'Dequeue removes data present in the Front position from the Queue',
    'Maximum size of this Queue is 6',
  ];

  //Return list of info
  List<Widget> infoWidget(){
    List<Widget> l = [];

    for(String info in list){
      l.add(
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    info,
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                ),
              ],
            ),
          )
      );

      l.add(
        SizedBox(
          height: 20,
        ),
      );
    }

    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(),
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: infoWidget(),
            ),
          ),
        ),
      ),
    );
  }
}