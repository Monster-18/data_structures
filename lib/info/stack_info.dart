import 'package:flutter/material.dart';

import 'package:data_structures/helper/functions.dart';

class StackInfo extends StatelessWidget {

  final List<String> list = [
    'Green color denotes data in the "Top" position',
    '"Push" pushes data into the Stack',
    '"Pop" pops out data present in the Top position from the Stack',
    'Maximum size of this Stack is 6',
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