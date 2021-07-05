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

  TextEditingController insertDataController = new TextEditingController();
  TextEditingController insertDataAfterController = new TextEditingController();

  //Controlling Radio Buttons
  bool isAfter = false;

  Future<void> alertBoxForInsertingData(BuildContext context){

    FlatButton okButton = new FlatButton(
      onPressed: (){},
      child: Text('OK'),
    );

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

    Column radioBtn = new Column(
      children: [
        Radio(
          value: false,
          groupValue: isAfter,
          onChanged: (bool value){
              isAfter = value;
          },
        ),
        Text('Insert At End'),
        Radio(
          value: true,
          groupValue: isAfter,
          onChanged: (bool value){
            isAfter = value;
          },
        ),
        Text('Insert After'),
      ],
    );

    Column contents = new Column(
      children: [
        insertData,
        radioBtn,
        (isAfter)? afterData: Container()
      ],
    );

    AlertDialog alert = new AlertDialog(
      title: Text('Insert Data'),
      content: contents,
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
                      color: Colors.blue,
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
                        color: Colors.green,
                          border: Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid)
                      ),
                      child: Text(''))
              )
            ],
          ),
        ),
      );

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
                    // await alertBoxForPushingData(context);
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
                  onPressed: (){
                    _listOperations.delete("1");
                    // _listOperations.insertAfter("2", "1");
                    setState(() {

                    });
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
                        color: //(error)? Colors.red: (info)? Colors.blue:
                        Colors.black,
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
                      // (error)?
                      // Text(
                      //   errorText,
                      //   style: TextStyle(
                      //       fontSize: 20.0
                      //   ),
                      // ):
                      // (info)?
                      // Text(
                      //   infoText,
                      //   style: TextStyle(
                      //       fontSize: 20.0
                      //   ),
                      // ):
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

class LinkedListOperations{
  List<String> list = [];

  //Inserting data atLast
  void insert(String data){
    list.add(data);
  }

  //Inserting data after an element
  void insertAfter(String data, String after){
    int index = list.indexOf(after);    //Index of the element

    list.insert(index+1, data);
  }

  //Deleting data from the list
  void delete(String data){
    list.remove(data);
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
