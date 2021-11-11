import 'package:flutter/material.dart';

import 'package:data_structures/helper/functions.dart';

class RBInfo extends StatelessWidget {

  final List<String> list = [
    'Left Node  <  Root Node  <  Right Node',
    'Red Black Tree is a kind of Self-Balancing Binary Search Tree',
    'Each node is either red or black',
    'The root is black [Optional]',
    'All NIL leaves are black',
    'A red node must not have red children',
    'All paths from a node to the leaves below contain the same number of black nodes',
    '"Insert" inserts data into the Red Black Tree',
    '"Delete" deletes the element from the Red Black Tree',
    'Data can be inserted only upto level 5',
    'Data should not be repeated'
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(),
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: infoWidget(),
            ),
          ),
        ),
      ),
    );
  }
}