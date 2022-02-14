import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Zoom
import 'package:zoom_widget/zoom_widget.dart';

import 'package:data_structures/operations/bst_operations.dart';

import 'package:data_structures/helper/functions.dart';

class BSTImplementation extends StatefulWidget {
  BSTOperations bstOperations;

  BSTImplementation({this.bstOperations});

  @override
  _BSTImplementationState createState() => _BSTImplementationState();
}

class _BSTImplementationState extends State<BSTImplementation> {
  BSTOperations bstOperations;
  /*
    * First arrows -> left: 2.6, right: 0.4
    * Second arrows -> left: 2.4, right: 0.7
    * Third arrows -> left: 2.2, right: 1.0
    * Fourth arrows -> left: 2.0, right: 0.4
  */

  TextEditingController eleController = new TextEditingController();

  //Display Errors
  bool error = false;
  String errorText;

  //Display Info
  bool info = false;
  String infoText;

  bool isOkBtnClicked = false;

  @override
  void initState() {
    bstOperations = widget.bstOperations;
    super.initState();
  }

  //Alert box for inserting & deleting elements
  Future<void> alertBox(BuildContext context, bool isInsert){

    TextButton insertButton = TextButton(
      onPressed: (){
        if(eleController.text.trim().isEmpty || eleController.text.trim().length > 5){
          eleController.clear();
        }else{
          isOkBtnClicked = true;
          Navigator.pop(context);
        }
      },
      child: Text(
        (isInsert)? "INSERT": "DELETE",
        style: TextStyle(
            color: Colors.blue
        ),
      ),
    );

    TextField text = TextField(
      controller: eleController,
      decoration: InputDecoration(
          hintText: (isInsert)? 'Element to be inserted': 'Element to be deleted',
          helperText: 'Limit: 1 to 5 digits',
          helperStyle: TextStyle(
              color: Colors.deepPurpleAccent
          )
      ),
      keyboardType: TextInputType.number,
    );

    AlertDialog alert = AlertDialog(
      title: (isInsert)? Text('Insert Data'): Text('Delete Data'),
      content: text,
      actions: [
        insertButton
      ],
    );

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return alert;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: boxDecoration(),
        constraints: boxConstraints(context),
        child: Column(
          children: [
            //BST Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.9525,     //400
              child: Container(
                color: Colors.red,
                child: Zoom(
                  maxZoomHeight: 1200,
                  maxZoomWidth: 1200,
                  initZoom: 0,
                  doubleTapZoom: false,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1800,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 1800,
                              child: ListView(
                                  children: tree(context, bstOperations)
                              ),
                            )
                          ],
                      ),
                    )
                  ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height/78.1, //10
            ),

            //Stack Operations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async{
                    await alertBox(context, true);

                    if(isOkBtnClicked){
                      String insertionData = eleController.text.trim();
                      try{
                        int insertData = int.parse(insertionData);
                        int res = bstOperations.insert(insertData);
                        switch(res){
                          case 0:
                            info = false;
                            error = true;
                            errorText = "'$insertionData' already existed";
                            break;
                          case 1:
                            error = false;
                            info = true;
                            infoText = "Inserted '$insertionData'";
                            break;
                          case 2:
                            error = false;
                            info = true;
                            infoText = "Exceeds Level 5";
                        }
                      }catch(e){
                        try{
                          double.parse(insertionData);
                          error = false;
                          info = true;
                          infoText = "Double is not supported";
                        }catch(e){
                          error = true;
                          info = false;
                          errorText = "Invalid data";
                        }
                      }

                      isOkBtnClicked = false;
                      setState(() {});
                    }
                    eleController.clear();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Insert',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width/24.545  //16
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async{
                    await alertBox(context, false);

                    if(isOkBtnClicked){
                      String deletionData = eleController.text.trim();
                      try{
                        int deleteData = int.parse(deletionData);
                        bool flag = bstOperations.delete(deleteData);
                        if(!flag){
                          info = false;
                          error = true;
                          errorText = "'$deletionData' not exists";
                        }else{
                          error = false;
                          info = true;
                          infoText = "Deleted '$deletionData'";
                        }
                      }catch(e){
                        try{
                          double.parse(deletionData);
                          error = false;
                          info = true;
                          infoText = "Double is not supported";
                        }catch(e){
                          error = true;
                          info = false;
                          errorText = "Invalid data";
                        }
                      }

                      isOkBtnClicked = false;
                      setState(() {});
                    }
                    eleController.clear();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width/24.545  //16
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height/19.525, //40
            ),

            //Info
            displayStatus(context, error, info, errorText, infoText),

            SizedBox(
              height: MediaQuery.of(context).size.height/78.1,   //10,
            ),
          ],
        ),
      ),
    );
  }
}