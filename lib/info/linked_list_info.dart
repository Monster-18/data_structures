import 'package:flutter/material.dart';

import 'package:data_structures/helper/functions.dart';

class LinkedListInfo extends StatelessWidget {

  final List<String> list = [
    'Yellow color denotes the Head nodes data',
    'Orange color denotes the pointer of the Head node',
    'Blue color denotes data',
    'Green color denotes pointer to the next data',
    '"Insert" inserts data into the Linked List',
    '"Delete" deletes the element from the Linked List',
  ];

  //List of info
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

  //For Displaying sample Node
  Widget displayNode(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 50,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    ),
                    child: Center(
                        child: Text(
                          'Data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                      ),
                      child: Center(
                          child: Text(
                            'Pointer',
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                          )
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(),
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                displayNode(),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: infoWidget(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}