import 'package:flutter/material.dart';

//Zoom
import 'package:zoom_widget/zoom_widget.dart';

import 'package:data_structures/operations/avl_tree_operations.dart';

import 'package:data_structures/helper/functions.dart';

class AVLImplementation extends StatefulWidget {
  AVLOperations avlOperations;

  AVLImplementation({this.avlOperations});

  @override
  _AVLImplementationState createState() => _AVLImplementationState();
}

class _AVLImplementationState extends State<AVLImplementation> {
  AVLOperations avlOperations;
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
    avlOperations = widget.avlOperations;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //AVL Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400.0,
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
                                  children: avl_tree(avlOperations)
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
              height: 10,
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
                        int res = avlOperations.insert(insertData);
                        switch(res){
                          case 0:
                            info = false;
                            error = true;
                            errorText = "$insertionData already existed";
                            break;
                          case 1:
                            error = false;
                            info = true;
                            infoText = "Inserted $insertionData";
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
                  child: Text('Insert'),
                ),
                TextButton(
                  onPressed: () async{
                    await alertBox(context, false);

                    if(isOkBtnClicked){
                      String deletionData = eleController.text.trim();
                      try{
                        int deleteData = int.parse(deletionData);
                        bool flag = avlOperations.delete(deleteData);
                        if(!flag){
                          info = false;
                          error = true;
                          errorText = "$deletionData not exists";
                        }else{
                          error = false;
                          info = true;
                          infoText = "Deleted $deletionData";
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