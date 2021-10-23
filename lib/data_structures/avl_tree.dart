import 'package:flutter/material.dart';

import 'package:data_structures/implementation/avl_tree_implementation.dart';
import 'package:data_structures/info/avl_tree_info.dart';
import 'package:data_structures/operations/avl_tree_operations.dart';

import 'package:data_structures/helper/functions.dart';

class AVLDS extends StatefulWidget {
  @override
  _AVLDSState createState() => _AVLDSState();
}

class _AVLDSState extends State<AVLDS> {
  AVLOperations avlOperations;

  @override
  void initState() {
    avlOperations = new AVLOperations();
    super.initState();
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
              AVLInfo()
            ],
          ),
        )
    );
  }
}
