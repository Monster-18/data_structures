import 'package:flutter/material.dart';

class AlertBoxForInserting extends StatefulWidget {
  TextEditingController insertDataController, insertDataAfterController;
  Function setDone, setIsAfter;

  AlertBoxForInserting({this.insertDataController, this.insertDataAfterController, this.setDone, this.setIsAfter});

  @override
  _AlertBoxForInsertingState createState() => _AlertBoxForInsertingState();
}

class _AlertBoxForInsertingState extends State<AlertBoxForInserting> {

  TextEditingController insertDataController;
  TextEditingController insertDataAfterController;

  //Controlling Radio Buttons
  bool isAfter = false;

  bool done = false; //For finding whether the "OK" Button is clicked or not

  @override
  void initState() {
    insertDataController = widget.insertDataController;
    insertDataAfterController = widget.insertDataAfterController;
    super.initState();
  }

  //Changing to default
  void changeToDefault(){
    insertDataController.clear();
    insertDataAfterController.clear();
    isAfter = false;
    widget.setIsAfter(isAfter); //For main page
  }

  @override
  Widget build(BuildContext context) {
    //Input data
    TextField insertData = new TextField(
      controller: insertDataController,
      decoration: InputDecoration(
          hintText: 'Insert Data',
          helperText: 'Limit: Maximum 3 digit data',
          helperStyle: TextStyle(
              color: Colors.deepPurpleAccent
          )
      ),
      keyboardType: TextInputType.number,
    );

    //Input data After
    TextField afterData = new TextField(
      controller: insertDataAfterController,
      decoration: InputDecoration(
          hintText: 'Data...',
          helperText: 'Limit: Enter existing data',
          helperStyle: TextStyle(
              color: Colors.deepPurpleAccent
          )
      ),
      keyboardType: TextInputType.number,
    );

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
                        widget.setIsAfter(isAfter);
                        setState(() {});
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
                        widget.setIsAfter(isAfter);
                        setState(() {});
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
        TextButton(
          onPressed: (){
            if(insertDataController.text.isEmpty || (isAfter && insertDataAfterController.text.isEmpty)){
              changeToDefault();
              setState(() {});
            }else if(insertDataController.text.length > 3 || (isAfter && insertDataAfterController.text.length > 3)) {
              changeToDefault();
              setState(() {});
            }else{
              done = true;
              widget.setDone(done);
              Navigator.pop(context);
            }
          },
          child: Text(
              'INSERT',
            style: TextStyle(
                color: Colors.blue
            ),
          ),
        )
      ],
    );
  }
}