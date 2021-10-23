import 'package:flutter/material.dart';

import 'package:data_structures/helper/functions.dart';

class AVLInfo extends StatelessWidget {

  final List<String> list = [
    'Left Node  <  Root Node  <  Right Node',
    'AVL Tree is a Height Balanced BST',
    'Balance Factor = Height of Left subtree - Height of right subtree',
    'Each nodes balance factor should be either -1, 0 or +1',
    'Green color represents root node',
    '"Insert" inserts data into the AVL Tree',
    '"Delete" deletes the element from the AVL Tree',
    'While deleting a node which has 2 children, it replaces the current node either with its inorder predecessor or inorder successor [Here it replaces with its inorder predecessor]',
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