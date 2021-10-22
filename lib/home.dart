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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      title: "Stack",
                      callback: (){
                        Navigator.pushNamed(context, '/stack');
                      },
                    ),
                    Button(
                      title: "Queue",
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
                      title: "Linked List",
                      callback: (){
                        Navigator.pushNamed(context, '/linkedList');
                      },
                    ),
                    Button(
                      title: "BST",
                      callback: (){
                        Navigator.pushNamed(context, '/bst');
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      title: "AVL Tree",
                      callback: (){
                        Navigator.pushNamed(context, '/avl');
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
