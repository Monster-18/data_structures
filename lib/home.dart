import 'package:flutter/material.dart';

import 'package:data_structures/helper/widgets/button.dart';
import 'package:data_structures/helper/functions.dart';

class Home extends StatelessWidget {
  AppBar appBar = AppBar(
    title: Text(
      'Data Structures',
      style: TextStyle(
        fontStyle: FontStyle.italic,
      ),
    ),
    centerTitle: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          decoration: boxDecoration(),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - appBar.preferredSize.height,
          ),
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
                    height: MediaQuery.of(context).size.height/39.05,   //20,
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
                    height: MediaQuery.of(context).size.height/39.05,   //20,
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
      ),
    );
  }
}
