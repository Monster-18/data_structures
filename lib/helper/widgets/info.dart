import 'package:flutter/material.dart';

import 'package:data_structures/helper/functions.dart';

class Info extends StatelessWidget {
  List<String> list;

  Info({this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(),
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: infoWidget(list),
            ),
          ),
        ),
      ),
    );
  }
}