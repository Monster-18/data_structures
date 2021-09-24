import 'package:flutter/material.dart';

import 'package:data_structures/implementation/bst_implementation.dart';
import 'package:data_structures/info/bst_info.dart';

class BSTDS extends StatefulWidget {
  @override
  _BSTDSState createState() => _BSTDSState();
}

class _BSTDSState extends State<BSTDS> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Binary Search Tree'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Working',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Info',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BSTImplementation(),
              BSTInfo()
            ],
          ),
        )
    );
  }
}
