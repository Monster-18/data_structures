import 'package:flutter/material.dart';

//Background
BoxDecoration boxDecoration(){
  return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.lightBlueAccent[100],
          Colors.lightGreenAccent[100]
        ],
      )
  );
}


//AppBar
AppBar appBar(String title){
  return AppBar(
    title: Text(title),
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
  );
}