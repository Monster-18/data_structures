import 'package:flutter/material.dart';

import 'package:data_structures/implementation/red_black_tree_implementation.dart';
import 'package:data_structures/info/red_black_tree_info.dart';
import 'package:data_structures/operations/red_black_tree_operations.dart';

import 'package:data_structures/helper/functions.dart';

class RBDS extends StatefulWidget {
  @override
  _RBDSState createState() => _RBDSState();
}

class _RBDSState extends State<RBDS> {
  RBOperations rbOperations;

  @override
  void initState() {
    rbOperations = new RBOperations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appBar('Red Black Tree'),
          body: TabBarView(
            children: [
              RBImplementation(
                rbOperations: rbOperations,
              ),
              RBInfo()
            ],
          ),
        )
    );
  }
}
