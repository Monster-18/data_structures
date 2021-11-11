import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String title1, title2;
  final VoidCallback callback;

  Button({this.title1, this.title2, this.callback});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  bool onPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTapDown: (details){
          setState(() {
            onPressed = true;
          });
        },
        onTapUp: (details){
          setState(() {
            onPressed = false;
          });
        },
        onTap: widget.callback,

        child: Container(
          width: (MediaQuery.of(context).size.width > 700)? 300: 150,
          height: (MediaQuery.of(context).size.width > 700)? 300: 150,
          decoration: BoxDecoration(
              color: Colors.tealAccent[100],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                //Background Shadow
                BoxShadow(
                  offset: (onPressed)? Offset(0.0, 0.0): Offset(3.0, 3.0),
                  color: Colors.blueGrey,
                ),
                BoxShadow(
                    offset: (onPressed)? Offset(3.0, 3.0): Offset(0.0, 0.0),
                    color: Colors.tealAccent[100]
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '${widget.title1}',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 26.0
                  ),
                ),
              ),
              (widget.title2 != null)?
                  Center(
                    child: Text(
                      '${widget.title2}',
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 26.0
                      ),
                    ),
                  ):
                  Expanded(
                    flex:0,
                    child: Container(),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}