import 'package:flutter/material.dart';

import 'package:data_structures/implementation/queue_implementation.dart';
import 'package:data_structures/operations/queue_operations.dart';

import 'package:data_structures/helper/functions.dart';
import 'package:data_structures/helper/widgets/info.dart';

class QueueDS extends StatefulWidget {
  @override
  _QueueDSState createState() => _QueueDSState();
}

class _QueueDSState extends State<QueueDS> {
  QueueOperations queue;

  //Info
  final List<String> list = [
    "Red color denotes data in the 'Front' position",
    "Blue color denotes data in the 'Rear' position",
    "Enqueue inserts data in the Rear position of the Queue",
    "Dequeue removes data present in the Front position from the Queue",
    "Maximum size of this Queue is 6",
  ];

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
          appBar: appBar(context, 'Queue'),
          body: TabBarView(
            children: [
              QueueImplementation(
                queue: queue,
              ),
              Info(list: list,)
            ],
          ),
        )
    );
  }
}

