import 'package:flutter/material.dart';

import 'package:data_structures/implementation/bst_implementation.dart';
import 'package:data_structures/info/bst_info.dart';
import 'package:data_structures/operations/bst_operations.dart';

import 'package:data_structures/helper/functions.dart';

class BSTDS extends StatefulWidget {
  @override
  _BSTDSState createState() => _BSTDSState();
}

class _BSTDSState extends State<BSTDS> {
  BSTOperations bstOperations;

  @override
  void initState() {
    bstOperations = new BSTOperations();
    super.initState();
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
              BSTInfo()
            ],
          ),
        )
    );
  }
}
