import 'package:flutter/material.dart';

class LinkedListDS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Linked List'),
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
          ),
          body: TabBarView(
            children: [
              LinkedListImplementation(),
              LinkedlistInfo()
            ],
          ),
        )
    );
  }
}

class LinkedListImplementation extends StatefulWidget {
  @override
  _LinkedListImplementationState createState() => _LinkedListImplementationState();
}

class _LinkedListImplementationState extends State<LinkedListImplementation> {
  LinkedListOperations _listOperations = new LinkedListOperations();

  TextEditingController deleteDataController = new TextEditingController();

  //Display Errors
  bool error = false;
  String errorText;

  //Display Info
  bool info = false;
  String infoText;

  bool done = false;    //For finding whether the "OK" Button is clicked or not in Delete alert box

  Future<void> alertBoxForInsertingData(BuildContext context){
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context){
        return AlertBoxForInserting();
      }
    );
  }

  Future<void> alertBoxForDeletingData(BuildContext context){
    FlatButton okButton = new FlatButton(
      onPressed: (){
        if(deleteDataController.text.isEmpty || deleteDataController.text.length > 3){
          deleteDataController.clear();
        }else{
          done = true;
          Navigator.pop(context);
        }
      },
      child: Text('OK'),
    );

    TextField text = new TextField(
      controller: deleteDataController,
      decoration: InputDecoration(
        hintText: 'Data to be deleted',
        helperText: 'Limit: Maximum 3 digits'
      ),
      keyboardType: TextInputType.number,
    );

    AlertDialog alert = new AlertDialog(
      title: Text('Delete Data'),
      content: text,
      actions: [
        okButton
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

  List<Widget> listBody(){
    List<String> list = _listOperations.getList();

    if(list.isEmpty){   //Empty List
      return [];
    }

    bool isHead = true;

    List<Widget> l = [];

    for(String data in list){
      l.add(
        //Node of a Linked List
        Container(
          width: 100,
          height: 50,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
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
                      height: 50,
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
    _AlertBoxForInsertingState.insertDataController.clear();
    _AlertBoxForInsertingState.insertDataAfterController.clear();
    _AlertBoxForInsertingState.isAfter = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Space for Implementation
            Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: 400.0,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: listBody()
                    // [
                    //   Container(
                    //     width: 100,
                    //     height: 50,
                    //     color: Colors.red,
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //           flex: 2,
                    //           child: Container(
                    //             height: 50,
                    //             decoration: BoxDecoration(
                    //               border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    //             ),
                    //             child: Center(child: Text('1')),
                    //           )
                    //         ),
                    //         Expanded(
                    //           flex: 1,
                    //
                    //             child: Container(
                    //               height: 50,
                    //                 decoration: BoxDecoration(
                    //                     border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    //                 ),
                    //                 child: Text(''))
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    //   Icon(
                    //       Icons.arrow_forward,
                    //     size: 20.0,
                    //   ),
                    //   Container(
                    //     width: 100,
                    //     height: 50,
                    //     color: Colors.red,
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //             flex: 2,
                    //             child: Container(
                    //               height: 50,
                    //               decoration: BoxDecoration(
                    //                   border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    //               ),
                    //               child: Center(child: Text('1')),
                    //             )
                    //         ),
                    //         Expanded(
                    //             flex: 1,
                    //
                    //             child: Container(
                    //                 height: 50,
                    //                 decoration: BoxDecoration(
                    //                     border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    //                 ),
                    //                 child: Text(''))
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    //   Container(
                    //     width: 100,
                    //     height: 50,
                    //     color: Colors.red,
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //             flex: 2,
                    //             child: Container(
                    //               height: 50,
                    //               decoration: BoxDecoration(
                    //                   border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    //               ),
                    //               child: Center(child: Text('1')),
                    //             )
                    //         ),
                    //         Expanded(
                    //             flex: 1,
                    //
                    //             child: Container(
                    //                 height: 50,
                    //                 decoration: BoxDecoration(
                    //                     border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    //                 ),
                    //                 child: Text(''))
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    //   Container(
                    //     width: 100,
                    //     height: 50,
                    //     color: Colors.red,
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //             flex: 2,
                    //             child: Container(
                    //               height: 50,
                    //               decoration: BoxDecoration(
                    //                   border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    //               ),
                    //               child: Center(child: Text('1')),
                    //             )
                    //         ),
                    //         Expanded(
                    //             flex: 1,
                    //
                    //             child: Container(
                    //                 height: 50,
                    //                 decoration: BoxDecoration(
                    //                     border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    //                 ),
                    //                 child: Text(''))
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    //   Container(
                    //     width: 100,
                    //     height: 50,
                    //     color: Colors.red,
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //             flex: 2,
                    //             child: Container(
                    //               height: 50,
                    //               decoration: BoxDecoration(
                    //                   border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    //               ),
                    //               child: Center(child: Text('1')),
                    //             )
                    //         ),
                    //         Expanded(
                    //             flex: 1,
                    //
                    //             child: Container(
                    //                 height: 50,
                    //                 decoration: BoxDecoration(
                    //                     border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                    //                 ),
                    //                 child: Text(''))
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ],
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
                RaisedButton(
                  onPressed: () async{
                    // _listOperations.insert("1");
                    // setState(() {
                    //
                    // });
                    await alertBoxForInsertingData(context);
                    // print(_AlertBoxForInsertingState.insertDataController.text);
                    // await alertBoxForPushingData(context);
                    if(_AlertBoxForInsertingState.done){
                      _AlertBoxForInsertingState.done = false;  //Changing to default
                      if(_AlertBoxForInsertingState.isAfter){
                        bool inserted = _listOperations.insertAfter(_AlertBoxForInsertingState.insertDataController.text, _AlertBoxForInsertingState.insertDataAfterController.text);
                        if(inserted){
                            error = false;
                            info = true;
                            infoText = '"${_AlertBoxForInsertingState.insertDataController.text}" inserted after "${_AlertBoxForInsertingState.insertDataAfterController.text}"';
                        }else{
                          error = true;
                          info = false;
                          errorText = '"${_AlertBoxForInsertingState.insertDataAfterController.text}" => Not found';
                        }
                        changeToDefault();
                      }else{
                        _listOperations.insert(_AlertBoxForInsertingState.insertDataController.text);
                        error = false;
                        info = true;
                        infoText = '"${_AlertBoxForInsertingState.insertDataController.text}" => Inserted';
                        changeToDefault();
                      }
                      setState(() {});
                    }else{
                      changeToDefault();
                    }

                    // if(pushEleController.text.isNotEmpty){
                    //   String pushedData = pushEleController.text.trim();
                    //   bool flag = _stack.push(pushedData);
                    //   pushEleController.clear();
                    //   if(!flag){
                    //     info = false;
                    //     error = true;
                    //     errorText = "Stack Overflow";
                    //   }else{
                    //     error = false;
                    //     info = true;
                    //     infoText = "Pushed $pushedData";
                    //   }
                    //   setState(() {});
                    // }
                  },
                  child: Text('Insert'),
                ),
                RaisedButton(
                  onPressed: () async{
                    // _listOperations.delete("1");
                    // // _listOperations.insertAfter("2", "1");
                    // setState(() {
                    //
                    // });
                    await alertBoxForDeletingData(context);
                    if(done){
                      done = false;   //Changing to Default
                      bool deleted = _listOperations.delete(deleteDataController.text);
                      if(deleted){
                        error = false;
                        info = true;
                        infoText = '"${deleteDataController.text}" deleted successfully';
                      }else{
                        error = true;
                        info = false;
                        errorText = '"${deleteDataController.text}" => Not found';
                      }
                      deleteDataController.clear();
                      setState(() {});
                    }else{
                      deleteDataController.clear();
                    }

                    // String data = _stack.pop();
                    // if(data == null){
                    //   info = false;
                    //   error = true;
                    //   errorText = "Stack Underflow";
                    // }else{
                    //   error = false;
                    //   info = true;
                    //   infoText = "Poped $data";
                    // }
                    // setState(() {});
                  },
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
                      child:(error)?
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
                            Text('Empty List'),
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

class AlertBoxForInserting extends StatefulWidget {
  @override
  _AlertBoxForInsertingState createState() => _AlertBoxForInsertingState();
}

class _AlertBoxForInsertingState extends State<AlertBoxForInserting> {

  static TextEditingController insertDataController = new TextEditingController();
  static TextEditingController insertDataAfterController = new TextEditingController();

  //Controlling Radio Buttons
  static bool isAfter = false;

  static bool done = false; //For finding whether the "OK" Button is clicked or not

  //Input data
  TextField insertData = new TextField(
    controller: insertDataController,
    decoration: InputDecoration(
        hintText: 'Insert Data',
        helperText: 'Limit: Maximum 3 digit data'
    ),
    keyboardType: TextInputType.number,
  );

  //Input data After
  TextField afterData = new TextField(
    controller: insertDataAfterController,
    decoration: InputDecoration(
        hintText: 'Data...',
        helperText: 'Limit: Enter existing data'
    ),
    keyboardType: TextInputType.number,
  );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Insert Data'),
      content: Container(
        width: 350,
        height: 210,
        child: Column(
          children: [
            insertData,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Radio(
                      value: false,
                      groupValue: isAfter,
                      onChanged: (bool value){
                        isAfter = value;
                        setState(() {

                        });
                      },
                    ),
                    Text('Insert At End'),
                  ],
                ),
                Column(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isAfter,
                      onChanged: (bool value){
                        isAfter = value;
                        setState(() {

                        });
                      },
                    ),
                    Text('Insert After'),
                  ],
                ),
              ],
            ),
            (isAfter)? afterData: Container()
          ],
        ),
      ),
      actions: [
        FlatButton(
          onPressed: (){
            if(_AlertBoxForInsertingState.insertDataController.text.isEmpty || (_AlertBoxForInsertingState.isAfter && _AlertBoxForInsertingState.insertDataAfterController.text.isEmpty)){
              //Changing to default
              _AlertBoxForInsertingState.insertDataController.clear();
              _AlertBoxForInsertingState.insertDataAfterController.clear();
              _AlertBoxForInsertingState.isAfter = false;
              setState(() {});
            }else if(_AlertBoxForInsertingState.insertDataController.text.length > 3 || (_AlertBoxForInsertingState.isAfter && _AlertBoxForInsertingState.insertDataAfterController.text.length > 3)) {
              //Changing to default
              _AlertBoxForInsertingState.insertDataController.clear();
              _AlertBoxForInsertingState.insertDataAfterController.clear();
              _AlertBoxForInsertingState.isAfter = false;
              setState(() {});
            }else{
              _AlertBoxForInsertingState.done = true;
              Navigator.pop(context);
            }
          },
          child: Text('OK'),
        )
      ],
    );
  }
}


class LinkedListOperations{
  List<String> list = [];

  //Inserting data atLast
  void insert(String data){
    list.add(data);
  }

  //Inserting data after an element
  bool insertAfter(String data, String after){
    int index = list.indexOf(after);    //Index of the element

    if(index == -1){    //Element not found
      return false;
    }

    list.insert(index+1, data);
    return true;
  }

  //Deleting data from the list
  bool delete(String data){
    return list.remove(data);
  }

  List<String> getList(){
    return list;
  }
}


class LinkedlistInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}