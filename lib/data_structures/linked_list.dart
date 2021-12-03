import 'package:flutter/material.dart';

import 'package:data_structures/implementation/linked_list_implementation.dart';
import 'package:data_structures/operations/linked_list_operations.dart';
import 'package:data_structures/info/linked_list_info.dart';

import 'package:data_structures/helper/functions.dart';

class LinkedListDS extends StatefulWidget {
  @override
  _LinkedListDSState createState() => _LinkedListDSState();
}

class _LinkedListDSState extends State<LinkedListDS> {
  LinkedListOperations listOperations;

  @override
  void initState() {
    //Creating Object for the LinkedListOperations Class
    listOperations = new LinkedListOperations();
    super.initState();
  }

  @override
  void dispose() {
    listOperations = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appBar('Linked List'),
          body: TabBarView(
            children: [
              LinkedListImplementation(
                listOperations: listOperations,
              ),
              LinkedListInfo()
            ],
          ),
        )
    );
  }
}


