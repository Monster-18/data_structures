import 'package:flutter/material.dart';

import 'package:data_structures/implementation/stack_implementation.dart';
import 'package:data_structures/operations/stack_operations.dart';
import 'package:data_structures/info/stack_info.dart';

import 'package:data_structures/helper/functions.dart';

class StackDS extends StatefulWidget {
  @override
  _StackDSState createState() => _StackDSState();
}

class _StackDSState extends State<StackDS> {
  StackOperations stack;

  @override
  void initState() {
    //Creating Object for class StackOperations
    stack = new StackOperations();
    super.initState();
  }

  @override
  void dispose() {
    stack = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appBar('Stack'),
          body: TabBarView(
            children: [
              StackImplementation(
                stack: stack,
              ),
              StackInfo()
            ],
          ),
        )
    );
  }
}
