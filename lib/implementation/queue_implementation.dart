import 'package:flutter/material.dart';

import 'package:data_structures/operations/queue_operations.dart';

import 'package:data_structures/helper/functions.dart';

class QueueImplementation extends StatefulWidget {
  QueueOperations queue;

  QueueImplementation({this.queue});

  @override
  _QueueImplementationState createState() => _QueueImplementationState();
}

class _QueueImplementationState extends State<QueueImplementation> {
  //Storing the reference of the object created in the _QueueDSState Class
  QueueOperations queue;

  TextEditingController enqueueController = new TextEditingController();

  //Display Errors
  bool error = false;
  String errorText;

  //Display Info
  bool info = false;
  String infoText;

  List<Widget> queueBody(){
    List<String> list = queue.getList();
    List<Widget> l = [];

    //Is both front and Rear points the same data?
    bool both = false;

    bool isFront = true;

    //Last Index (i.e)Rear
    int index=0;
    int currentIndex = 0;

    if(list.length == 1){   //Both Front and Rear points the same data
      both = true;
    }else if(list.length > 1){
      index = list.length - 1;
    }

    for(String data in list){
      l.add(
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 30,
            decoration: BoxDecoration(
              gradient: (both)?
              LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.red,
                    Colors.blue
                  ]
              ):
              null,
              color: (both)?
              null:
              (isFront)?
              Colors.red:
              (currentIndex == index)?
              Colors.blue:
              Colors.green,
            ),
            child: Center(
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  data,
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      if(isFront){
        isFront = false;
      }
      currentIndex++;
    }

    return l;
  }

  //Alert box for getting elements to be entered in the queue
  Future<void> alertBoxForEnqueueData(BuildContext context){

    TextButton enqueueButton = TextButton(
      onPressed: (){
        if(enqueueController.text.trim().isEmpty || enqueueController.text.trim().length > 10){
          enqueueController.clear();
        }else{
          Navigator.pop(context);
        }
      },
      child: Text(
          "ENQUEUE",
        style: TextStyle(
          color: Colors.blue
      ),
      ),
    );

    TextField text = TextField(
      controller: enqueueController,
      decoration: InputDecoration(
        hintText: 'Element to be entered',
        helperText: 'Limit: 1 to 10 characters',
          helperStyle: TextStyle(
              color: Colors.deepPurpleAccent
          )
      ),
    );

    AlertDialog alert = AlertDialog(
      title: Text('Enqueue Data'),
      content: text,
      actions: [
        enqueueButton
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
    queue = widget.queue;
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
            //Queue Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400.0,
              child: Container(
                child: Center(
                  child: Container(
                    width: 230,
                    height: 160,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: queueBody(),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            //Queue Operations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () async{
                    await alertBoxForEnqueueData(context);

                    if(enqueueController.text.isNotEmpty){
                      String data = enqueueController.text.trim();
                      bool flag = queue.enqueue(data);
                      enqueueController.clear();
                      if(!flag){
                        info = false;
                        error = true;
                        errorText = "Queue is full";
                      }else{
                        error = false;
                        info = true;
                        infoText = '"$data" entered the Queue';
                      }
                      setState(() {});
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Enqueue',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    String data = queue.dequeue();
                    if(data == null){
                      info = false;
                      error = true;
                      errorText = "Queue is Empty";
                    }else{
                      error = false;
                      info = true;
                      infoText = '"$data" removed from the Queue';
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Dequeue',
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
                        color:
                        (error)? Colors.red: (info)? Colors.blue: Colors.black,
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