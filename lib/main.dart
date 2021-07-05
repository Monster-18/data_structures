import 'package:flutter/material.dart';

//Home Page
import 'package:data_structures/home.dart';

//Data Structures
import 'package:data_structures/data_structures/stack.dart';
import 'package:data_structures/data_structures/queue.dart';
import 'package:data_structures/data_structures/linked_list.dart';

void main() {
  runApp(MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Structure',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,

      initialRoute: '/',
      routes: {
        '/': (context) => Home(),

        //Data Structures
        '/stack': (context) => StackDS(),
        '/queue': (context) => QueueDS(),
        '/linkedList': (context) => LinkedListDS()
      },

    );
  }
}
