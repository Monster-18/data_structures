import 'package:flutter/material.dart';

import 'package:data_structures/helper/widgets/button.dart';
import 'package:data_structures/helper/functions.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Structures'),
        centerTitle: true,
      ),
      body: Container(
        decoration: boxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      title1: "Stack",
                      title2: null,
                      callback: (){
                        Navigator.pushNamed(context, '/stack');
                      },
                    ),
                    Button(
                      title1: "Queue",
                      title2: null,
                      callback: (){
                        Navigator.pushNamed(context, '/queue');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      title1: "Linked List",
                      title2: null,
                      callback: (){
                        Navigator.pushNamed(context, '/linkedList');
                      },
                    ),
                    Button(
                      title1: "BST",
                      title2: null,
                      callback: (){
                        Navigator.pushNamed(context, '/bst');
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      title1: "AVL Tree",
                      title2: null,
                      callback: (){
                        Navigator.pushNamed(context, '/avl');
                      },
                    ),
                    Button(
                      title1: "Red Black",
                      title2: "Tree",
                      callback: (){
                        Navigator.pushNamed(context, '/rb');
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
