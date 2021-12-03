import 'package:flutter/material.dart';

import 'package:data_structures/operations/linked_list_operations.dart';

import 'package:data_structures/helper/widgets/linked_list_alert_insert.dart';

import 'package:data_structures/helper/functions.dart';

class LinkedListImplementation extends StatefulWidget {
  LinkedListOperations listOperations;

  LinkedListImplementation({this.listOperations});

  @override
  _LinkedListImplementationState createState() => _LinkedListImplementationState();
}

class _LinkedListImplementationState extends State<LinkedListImplementation> {
  //Storing the reference of the object created in the _LinkedListDSState Class
  LinkedListOperations listOperations;

  //Text Editing Controllers
  TextEditingController insertDataController = new TextEditingController();
  TextEditingController deleteDataController = new TextEditingController();
  TextEditingController insertDataAfterController = new TextEditingController();

  //Display Errors
  bool error = false;
  String errorText;

  //Display Info
  bool info = false;
  String infoText;

  //For insert alert box
  bool isAfter = false;
  bool done = false;

  bool del_done = false;    //For finding whether the "Delete" Button is clicked or not in Delete alert box

  //Callback Functions to alter the done and isAfter values of this class
  void setDone(bool flag){
    done = flag;
  }
  void setIsAfter(bool flag){
    isAfter = flag;
  }

  //Alert box for insert data
  Future<void> alertBoxForInsertingData(BuildContext context){
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertBoxForInserting(
            insertDataController: insertDataController,
            insertDataAfterController: insertDataAfterController,
            setDone: setDone,
            setIsAfter: setIsAfter,
          );
        }
    );
  }

  //Alert box for delete data
  Future<void> alertBoxForDeletingData(BuildContext context){
    //Delete Button
    TextButton deleteButton = new TextButton(
      onPressed: (){
        if(deleteDataController.text.isEmpty || deleteDataController.text.length > 3){
          deleteDataController.clear();
        }else{
          del_done = true;
          Navigator.pop(context);
        }
      },
      child: Text(
          'DELETE',
        style: TextStyle(
          color: Colors.blue
        ),
      ),
    );

    //Text Field for getting the data to be deleted
    TextField text = new TextField(
      controller: deleteDataController,
      decoration: InputDecoration(
          hintText: 'Data to be deleted',
          helperText: 'Limit: Maximum 3 digits',
          helperStyle: TextStyle(
              color: Colors.deepPurpleAccent
          )
      ),
      keyboardType: TextInputType.number,
    );

    AlertDialog alert = new AlertDialog(
      title: Text('Delete Data'),
      content: text,
      actions: [
        deleteButton
      ],
    );

    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          return alert;
        }
    );
  }

  //List od data to be displayed
  List<Widget> listBody(){
    List<String> list = listOperations.getList();

    if(list.isEmpty){   //Empty List
      return [];
    }

    bool isHead = true;

    List<Widget> l = [];

    for(String data in list){
      l.add(
        //Node of a Linked List
        Container(
          width: MediaQuery.of(context).size.width/3.92, //100
          height: MediaQuery.of(context).size.height/15.62, //50
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height/15.62, //50
                    decoration: BoxDecoration(
                        color: (isHead)? Colors.yellow: Colors.blue,
                        border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    ),
                    child: Center(
                        child: Text(
                          '$data',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                      height: MediaQuery.of(context).size.height/15.62, //50
                      decoration: BoxDecoration(
                          color: (isHead)? Colors.orange: Colors.green,
                          border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                      ),
                      child: Text(''))
              )
            ],
          ),
        ),
      );

      if(isHead){
        isHead = false;
      }

      //Connector Arrow
      l.add(
        Icon(
          Icons.arrow_forward,
          size: 30.0,
        ),
      );
    }

    //Adds Null Pointer at last
    l.add(
        Center(
          child: Text(
            'NULL',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0
            ),
          ),
        )
    );

    return l;

  }

  void changeToDefault(){
    insertDataController.clear();
    insertDataAfterController.clear();
    isAfter = false;
  }

  @override
  void initState() {
    listOperations = widget.listOperations;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: boxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Space for Implementation
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.9525,  //400
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: listBody()
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //List Operations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async{
                    await alertBoxForInsertingData(context);

                    if(done){    //For checking whether the "Insert" Button is clicked
                      done = false;  //Changing to default
                      if(isAfter){
                        bool inserted = listOperations.insertAfter(insertDataController.text, insertDataAfterController.text);
                        if(inserted){
                          error = false;
                          info = true;
                          infoText = "'${insertDataController.text}' inserted after '${insertDataAfterController.text}'";
                        }else{
                          error = true;
                          info = false;
                          errorText = "'${insertDataAfterController.text}' => Not found";
                        }
                        changeToDefault();
                      }else{
                        listOperations.insert(insertDataController.text);
                        error = false;
                        info = true;
                        infoText = "'${insertDataController.text}' => Inserted";
                        changeToDefault();
                      }
                      setState(() {});
                    }else{
                      changeToDefault();
                    }
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
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async{
                    await alertBoxForDeletingData(context);

                    if(del_done){   //For checking whether the "Delete" Button is clicked
                      del_done = false;   //Changing to Default
                      bool deleted = listOperations.delete(deleteDataController.text);
                      if(deleted){
                        error = false;
                        info = true;
                        infoText = "'${deleteDataController.text}' deleted successfully";
                      }else{
                        error = true;
                        info = false;
                        errorText = "'${deleteDataController.text}' => Not found";
                      }
                      deleteDataController.clear();
                      setState(() {});
                    }else{
                      deleteDataController.clear();
                    }
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
                          fontSize: 16
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
              height: MediaQuery.of(context).size.height/19.525, //40
            ),
          ],
        ),
      ),
    );
  }
}