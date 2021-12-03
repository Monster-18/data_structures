import 'package:flutter/material.dart';

import 'package:data_structures/implementation/bst_implementation.dart';
import 'package:data_structures/operations/bst_operations.dart';

import 'package:data_structures/helper/functions.dart';
import 'package:data_structures/helper/widgets/info.dart';

class BSTDS extends StatefulWidget {
  @override
  _BSTDSState createState() => _BSTDSState();
}

class _BSTDSState extends State<BSTDS> {
  BSTOperations bstOperations;

  //Info
  final List<String> list = [
    "Left Node  <  Root Node  <  Right Node",
    "Green color represents root node",
    "'Insert' inserts data into the Binary Search Tree",
    "'Delete' deletes the element from the Binary Search Tree",
    "Data can be inserted only upto level 5",
    "Data should not be repeated"
  ];

  @override
  void initState() {
    bstOperations = new BSTOperations();
    super.initState();
  }

  @override
  void dispose() {
    bstOperations = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appBar('Binary Search Tree'),
          body: TabBarView(
            children: [
              BSTImplementation(
                bstOperations: bstOperations,
              ),
              Info(list: list,)
            ],
          ),
        )
    );
  }
}
