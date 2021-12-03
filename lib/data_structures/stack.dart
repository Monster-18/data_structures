import 'package:flutter/material.dart';

import 'package:data_structures/implementation/stack_implementation.dart';
import 'package:data_structures/operations/stack_operations.dart';

import 'package:data_structures/helper/functions.dart';
import 'package:data_structures/helper/widgets/info.dart';

class StackDS extends StatefulWidget {
  @override
  _StackDSState createState() => _StackDSState();
}

class _StackDSState extends State<StackDS> {
  StackOperations stack;

  //Info
  final List<String> list = [
    "Green color denotes data in the 'Top' position",
    "'Push' pushes data into the Stack",
    "'Pop' pops out data present in the Top position from the Stack",
    "Maximum size of this Stack is 6",
  ];

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
              Info(list: list,)
            ],
          ),
        )
    );
  }
}
