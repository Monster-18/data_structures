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

  @override
  void initState() {
    bstOperations = widget.bstOperations;
    super.initState();
  }

  //Alert box for inserting elements
  Future<void> alertBox(BuildContext context, bool isInsert){

    TextButton insertButton = TextButton(
      onPressed: (){
        if(eleController.text.trim().isEmpty || eleController.text.trim().length > 5){
          eleController.clear();
        }else{
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
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.lightBlueAccent,
                Colors.lightGreenAccent
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //BST Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400.0,
              child: Container(
                color: Colors.red,
                child: Zoom(
                  maxZoomWidth: 1500,
                  maxZoomHeight: 1500,
                  initZoom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: tree(bstOperations)
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //Stack Operations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async{
                    await alertBox(context, true);

                    if(eleController.text.isNotEmpty){
                      String insertionData = eleController.text.trim();
                      int insertData = int.parse(insertionData);
                      bool flag = bstOperations.insert(insertData);
                      eleController.clear();
                      if(!flag){
                        info = false;
                        error = true;
                        errorText = "$insertionData already existed";
                      }else{
                        error = false;
                        info = true;
                        infoText = "Inserted $insertionData";
                      }
                      setState(() {});
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: Text('Insert'),
                ),
                TextButton(
                  onPressed: () async{
                    await alertBox(context, false);

                    if(eleController.text.isNotEmpty){
                      String deletionData = eleController.text.trim();
                      int deleteData = int.parse(deletionData);
                      bool flag = bstOperations.delete(deleteData);
                      eleController.clear();
                      if(!flag){
                        info = false;
                        error = true;
                        errorText = "$deletionData not exists";
                      }else{
                        error = false;
                        info = true;
                        infoText = "Deleted $deletionData";
                      }
                      setState(() {});
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: Text('Delete'),
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),

            //Info
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: (error)? Colors.red: (info)? Colors.blue: Colors.black,
                        width: 2.0,
                        style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Center(
                      child:
                      (error)?
                      Text(
                        errorText,
                        style: TextStyle(
                            fontSize: 20.0
                        ),
                      ):
                      (info)?
                      Text(
                        infoText,
                        style: TextStyle(
                            fontSize: 20.0
                        ),
                      ):
                      Text(''),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}