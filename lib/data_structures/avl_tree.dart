import 'package:flutter/material.dart';

import 'package:data_structures/implementation/avl_tree_implementation.dart';
import 'package:data_structures/operations/avl_tree_operations.dart';

import 'package:data_structures/helper/functions.dart';
import 'package:data_structures/helper/widgets/info.dart';

class AVLDS extends StatefulWidget {
  @override
  _AVLDSState createState() => _AVLDSState();
}

class _AVLDSState extends State<AVLDS> {
  AVLOperations avlOperations;

  //Info
  final List<String> list = [
    "Left Node  <  Root Node  <  Right Node",
    "AVL Tree is a Height Balanced BST",
    "Balance Factor = Height of Left subtree - Height of right subtree",
    "Each nodes balance factor should be either -1, 0 or +1",
    "Green color represents root node",
    "'Insert' inserts data into the AVL Tree",
    "'Delete' deletes the element from the AVL Tree",
    "While deleting a node which has 2 children, it replaces the current node either with its inorder predecessor or inorder successor [Here it replaces with its inorder predecessor]",
    "Data can be inserted only upto level 5",
    "Data should not be repeated"
  ];

  @override
  void initState() {
    avlOperations = new AVLOperations();
    super.initState();
  }

  @override
  void dispose() {
    avlOperations = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appBar('AVL Tree'),
          body: TabBarView(
            children: [
              AVLImplementation(
                avlOperations: avlOperations,
              ),
              Info(list: list,)
            ],
          ),
        )
    );
  }
}
