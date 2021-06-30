import 'package:flutter/material.dart';

class QueueDS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Queue'),
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
              QueueImplementation(),
              QueueInfo()
            ],
          ),
        )
    );
  }
}

class QueueImplementation extends StatefulWidget {
  @override
  _QueueImplementationState createState() => _QueueImplementationState();
}

class _QueueImplementationState extends State<QueueImplementation> {
  //Creating Object for QueueOperations Class
  QueueOperations _queue = new QueueOperations();

  TextEditingController enqueueController = new TextEditingController();

  //Display Errors
  bool error = false;
  String errorText;

  //Display Info
  bool info = false;
  String infoText;

  List<Widget> queueBody(){
    List<String> list = _queue.getList();
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

    FlatButton okButton = FlatButton(
      onPressed: (){
        if(enqueueController.text.trim().isEmpty || enqueueController.text.trim().length > 10){
          enqueueController.clear();
        }else{
          Navigator.pop(context);
        }
      },
      child: Text("OK"),
    );

    TextField text = TextField(
      controller: enqueueController,
      decoration: InputDecoration(
        hintText: 'Element to be entered',
        helperText: 'Limit: 1 to 10 characters',
      ),
    );

    AlertDialog alert = AlertDialog(
      title: Text('Enqueue Data'),
      content: text,
      actions: [
        okButton
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
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Queue Container
            Container(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: 400.0,
              child: Container(
                child: Center(
                  child: Container(
                    width: 230,
                    height: 160,
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: queueBody(),
                        // [
                        //   Padding(
                        //     padding: const EdgeInsets.all(2.0),
                        //     child: Container(
                        //       width: 30,
                        //       color: Colors.red,
                        //       child: Center(
                        //         child: RotatedBox(
                        //           quarterTurns: 3,
                        //           child: Text(
                        //             'Hello kkkk bbbbbbb',
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        //   Padding(
                        //     padding: const EdgeInsets.all(2.0),
                        //     child: Container(
                        //       width: 30,
                        //       color: Colors.green,
                        //     ),
                        //   ),
                        // ],
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
                RaisedButton(
                  onPressed: () async{
                    await alertBoxForEnqueueData(context);
                    if(enqueueController.text.isNotEmpty){
                      String data = enqueueController.text.trim();
                      bool flag = _queue.enqueue(data);
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
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                        'Enqueue',
                      style: TextStyle(
                        fontSize: 16.0
                      ),
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    String data = _queue.dequeue();
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
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                        'Dequeue',
                      style: TextStyle(
                          fontSize: 16.0
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
                        (error)? Colors.red: (info)? Colors.blue:
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
                        Text('Empty Queue'),
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

class QueueOperations{
  List<String> list = [];

  bool enqueue(String data){
    if(list.length > 5){
      return false;
    }

    list.add(data);
    return true;
  }

  String dequeue(){
    if(list.length > 0){
      return list.removeAt(0);
    }

    return null;
  }

  List<String> getList(){
    return list;
  }
}


class QueueInfo extends StatelessWidget {

  final List<String> list = [
    'Red color denotes data in the "Front" position',
    'Blue color denotes data in the "Rear" position',
    'Enqueue inserts data in the Rear position of the Queue',
    'Dequeue removes data present in the Front position from the Queue',
    'Maximum size of this Queue is 6',
  ];

  List<Widget> infoWidget(){
    List<Widget> l = [];

    for(String info in list){
      l.add(
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    info,
                    style: TextStyle(
                        fontSize: 20.0
                    ),
                  ),
                ),
              ],
            ),
          )
      );

      l.add(
        SizedBox(
          height: 20,
        ),
      );
    }

    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: infoWidget(),
        ),
      ),
    );
  }
}
