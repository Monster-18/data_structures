import 'package:flutter/material.dart';

import 'package:data_structures/implementation/queue_implementation.dart';
import 'package:data_structures/operations/queue_operations.dart';
import 'package:data_structures/info/queue_info.dart';

import 'package:data_structures/helper/functions.dart';

class QueueDS extends StatefulWidget {
  @override
  _QueueDSState createState() => _QueueDSState();
}

class _QueueDSState extends State<QueueDS> {
  QueueOperations queue;

  @override
  void initState() {
    //Creating Object for QueueOperations Class
    queue = new QueueOperations();
    super.initState();
  }

  @override
  void dispose() {
    queue = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: appBar('Queue'),
          body: TabBarView(
            children: [
              QueueImplementation(
                queue: queue,
              ),
              QueueInfo()
            ],
          ),
        )
    );
  }
}

