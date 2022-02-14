import 'package:flutter/material.dart';

import 'package:data_structures/implementation/red_black_tree_implementation.dart';
import 'package:data_structures/operations/red_black_tree_operations.dart';

import 'package:data_structures/helper/functions.dart';
import 'package:data_structures/helper/widgets/info.dart';

class RBDS extends StatefulWidget {
  @override
  _RBDSState createState() => _RBDSState();
}

class _RBDSState extends State<RBDS> {
  RBOperations rbOperations;

  //Info
  final List<String> list = [
    "Left Node  <  Root Node  <  Right Node",
    "Red Black Tree is a kind of Self-Balancing Binary Search Tree",
    "Each node is either red or black",
    "The root is black [Optional]",
    "All NIL leaves are black",
    "A red node must not have red children",
    "All paths from a node to the leaves below contain the same number of black nodes",
    "'Insert' inserts data into the Red Black Tree",
    "'Delete' deletes the element from the Red Black Tree",
    "Data can be inserted only upto level 5",
    "Data should not be repeated"
  ];

  @override
  void initState() {
    rbOperations = new RBOperations();
    super.initState();
  }

  @override
  void dispose() {
    rbOperations = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appBar(context, 'Red Black Tree'),
          body: TabBarView(
            children: [
              RBImplementation(
                rbOperations: rbOperations,
              ),
              Info(list: list,)
            ],
          ),
        )
    );
  }
}
