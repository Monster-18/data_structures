import 'package:flutter/material.dart';

class StackDS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Stack'),
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
              StackImplementation(),
              StackInfo()
            ],
          ),
        )
    );
  }
}

class StackImplementation extends StatefulWidget {
  @override
  _StackImplementationState createState() => _StackImplementationState();
}

class _StackImplementationState extends State<StackImplementation> {
  //Creating Object for class StackOperations
  StackOperations _stack = new StackOperations();

  TextEditingController pushEleController = new TextEditingController();

  //Display Errors
  bool error = false;
  String errorText;

  //Display Info
  bool info = false;
  String infoText;

  List<Widget> stackBody(){
    List<String> list = _stack.getList();
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

    FlatButton okButton = FlatButton(
      onPressed: (){
        if(pushEleController.text.isEmpty || pushEleController.text.length > 10){
          pushEleController.clear();
        }else{
          Navigator.pop(context);
        }
      },
      child: Text("OK"),
    );

    TextField text = TextField(
      controller: pushEleController,
      decoration: InputDecoration(
        hintText: 'Element to be pushed',
        helperText: 'Limit: 1 to 10 characters',
      ),
    );

    AlertDialog alert = AlertDialog(
      title: Text('Push Data'),
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
            //Stack Container
            Container(
              // color: Colors.red,
              width: MediaQuery.of(context).size.width,
              height: 400.0,
              child: Container(
                child: Center(
                  child: Container(
                    width: 180,
                    height: 250,
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: stackBody(),
                        // [
                        //   Padding(
                        //     padding: const EdgeInsets.all(2.0),
                        //     child: Container(
                        //       height: 30,
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        //   Padding(
                        //     padding: const EdgeInsets.all(2.0),
                        //     child: Container(
                        //       height: 30,
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

            //Stack Operations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    onPressed: () async{
                      await alertBoxForPushingData(context);
                      if(pushEleController.text.isNotEmpty){
                        String pushedData = pushEleController.text;
                        bool flag = _stack.push(pushedData);
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
                  child: Text('Push'),
                ),
                RaisedButton(
                  onPressed: (){
                    String data = _stack.pop();
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
                  child: Text('Pop'),
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
                          Text('Empty Stack'),
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

class StackOperations{
  List<String> list = [];

  bool push(String data){
    if(list.length > 5){      //Overflow Condition
      return false;
    }

    list.insert(0, data);
    return true;
  }

  String pop(){
    if(list.isEmpty){       //Underflow Condition
      return null;
    }

    String popedElement = list.first;
    list.removeAt(0);
    return popedElement;
  }

  List<String> getList(){
    return list;
  }
}

class StackInfo extends StatelessWidget {

  final List<String> list = [
    'Green color denotes data in the "Top" position',
    '"Push" pushes data into the Stack',
    '"Pop" pops out data present in the Top position from the Stack',
    'Maximum size of this Stack is 6',
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
