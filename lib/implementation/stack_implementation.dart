import 'package:flutter/material.dart';

import 'package:data_structures/operations/stack_operations.dart';

import 'package:data_structures/helper/functions.dart';

class StackImplementation extends StatefulWidget {
  StackOperations stack;

  StackImplementation({this.stack});

  @override
  _StackImplementationState createState() => _StackImplementationState();
}

class _StackImplementationState extends State<StackImplementation> {
  //Storing the reference of the object created in Stack
  StackOperations stack;

  TextEditingController pushEleController = new TextEditingController();

  //Display Errors
  bool error = false;
  String errorText;

  //Display Info
  bool info = false;
  String infoText;

  //Display Stack
  List<Widget> stackBody(){
    List<String> list = stack.getList();
    List<Widget> l = [];

    bool isTop = true;

    for(String data in  list){
      l.add(
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            height: 30,
            color: (isTop)? Colors.green: Colors.red,
            child: Center(
                child: Text(data)
            ),
          ),
        ),
      );

      if(isTop){
        isTop = false;
      }

    }

    return l;
  }

  //Alert box for getting element to be pushed
  Future<void> alertBoxForPushingData(BuildContext context){

    TextButton pushButton = TextButton(
      onPressed: (){
        if(pushEleController.text.trim().isEmpty || pushEleController.text.trim().length > 10){
          pushEleController.clear();
        }else{
          Navigator.pop(context);
        }
      },
      child: Text(
          "PUSH",
        style: TextStyle(
          color: Colors.blue
        ),
      ),
    );

    TextField text = TextField(
      controller: pushEleController,
      decoration: InputDecoration(
        hintText: 'Element to be pushed',
        helperText: 'Limit: 1 to 10 characters',
        helperStyle: TextStyle(
          color: Colors.deepPurpleAccent
        )
      ),
    );

    AlertDialog alert = AlertDialog(
      title: Text('Push Data'),
      content: text,
      actions: [
        pushButton
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
  void initState() {
    stack = widget.stack;
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
            //Stack Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400.0,
              child: Container(
                child: Center(
                  child: Container(
                    width: 180,
                    height: 250,
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: Colors.yellow[700],
                                width: 3.0,
                                style: BorderStyle.solid
                            ),
                            right: BorderSide(
                                color: Colors.yellow[700],
                                width: 3.0,
                                style: BorderStyle.solid
                            ),
                            bottom: BorderSide(
                                color: Colors.yellow[700],
                                width: 3.0,
                                style: BorderStyle.solid
                            )
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: stackBody(),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //Stack Operations [Push, Pop]
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async{
                    await alertBoxForPushingData(context);

                    if(pushEleController.text.isNotEmpty){
                      String pushedData = pushEleController.text.trim();
                      bool flag = stack.push(pushedData);
                      pushEleController.clear();
                      if(!flag){
                        info = false;
                        error = true;
                        errorText = "Stack Overflow";
                      }else{
                        error = false;
                        info = true;
                        infoText = "Pushed $pushedData";
                      }
                      setState(() {});
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: Container(
                      width: 60,
                      height: 30,
                      child: Center(
                        child: Text(
                            'Push',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                            ),
                        ),
                      )
                  ),
                ),
                TextButton(
                  onPressed: (){
                    String data = stack.pop();
                    if(data == null){
                      info = false;
                      error = true;
                      errorText = "Stack Underflow";
                    }else{
                      error = false;
                      info = true;
                      infoText = "Poped $data";
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: Container(
                      width: 60,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Pop',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                          ),
                        ),
                      )
                  ),
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
                      child: (error)?
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