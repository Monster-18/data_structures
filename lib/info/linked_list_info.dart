import 'package:flutter/material.dart';

import 'package:data_structures/helper/functions.dart';

class LinkedListInfo extends StatelessWidget {

  final List<String> list = [
    "Yellow color denotes the Head nodes data",
    "Orange color denotes the pointer of the Head node",
    "Blue color denotes data",
    "Green color denotes pointer to the next data",
    "'Insert' inserts data into the Linked List",
    "'Delete' deletes the element from the Linked List",
  ];

  //For Displaying sample Node
  Widget displayNode(BuildContext context){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width/1.96, //200
          height: MediaQuery.of(context).size.height/15.62, //50
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height/15.62, //50
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
                      height: MediaQuery.of(context).size.height/15.62, //50
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
                displayNode(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height/39.05, //20
                ),
                Column(
                  children: infoWidget(list),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}