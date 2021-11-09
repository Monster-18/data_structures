import 'package:flutter/material.dart';

//Home Page
import 'package:data_structures/home.dart';

//Data Structures
import 'package:data_structures/data_structures/stack.dart';
import 'package:data_structures/data_structures/queue.dart';
import 'package:data_structures/data_structures/linked_list.dart';
import 'package:data_structures/data_structures/bst.dart';
import 'package:data_structures/data_structures/avl_tree.dart';
import 'package:data_structures/data_structures/red_black_tree.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Data Structure',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            appBarTheme: AppBarTheme(
                color: Colors.green
            )
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),

          //Data Structures
          '/stack': (context) => StackDS(),
          '/queue': (context) => QueueDS(),
          '/linkedList': (context) => LinkedListDS(),
          '/bst': (context) => BSTDS(),
          '/avl': (context) => AVLDS(),
          '/rb': (context) => RBDS()
        },

      )
  );
}