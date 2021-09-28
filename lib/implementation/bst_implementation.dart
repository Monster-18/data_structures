import 'package:flutter/material.dart';

//Zoom
import 'package:zoom_widget/zoom_widget.dart';

import 'package:data_structures/operations/bst_operations.dart';

class BSTImplementation extends StatefulWidget {
  @override
  _BSTImplementationState createState() => _BSTImplementationState();
}

class _BSTImplementationState extends State<BSTImplementation> {

  /*
    * First arrows -> left: 2.6, right: 0.4
    * Second arrows -> left: 2.4, right: 0.7
    * Third arrows -> left: 2.2, right: 1.0
    * Fourth arrows -> left: 2.0, right: 0.4
  */

  Widget node(String text){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }

  Widget leftArrow(){
    return Expanded(
      flex:1,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Transform.rotate(
              angle: 2.0,
              child: Icon(
                  Icons.arrow_forward
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rightArrow(){
    return Expanded(
      flex:1,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 50,
            height: 50,
            child: Transform.rotate(
              angle: 1.3,
              child: Icon(
                  Icons.arrow_forward
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget expand(){
    return Expanded(
      flex:1,
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.lightBlueAccent,
                Colors.lightGreenAccent
              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //BST Container
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400.0,
              child: Container(
                color: Colors.red,
                child: Zoom(
                  maxZoomWidth: 1500,
                  maxZoomHeight: 1500,
                  initZoom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            node('1')
                          ],
                        ),

                        //Arrows
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SizedBox(
                        //       width: 50,
                        //       height: 40,
                        //       child: Transform.rotate(
                        //         angle: 2.3,
                        //         child: Icon(
                        //             Icons.arrow_forward
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(width: 50),
                        //     SizedBox(
                        //       width: 50,
                        //       height: 40,
                        //       child: Transform.rotate(
                        //         angle: 0.6,
                        //         child: Icon(
                        //             Icons.arrow_forward
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     node('2'),
                        //     SizedBox(width: 100,),
                        //     node('3')
                        //   ],
                        // ),
                        Row(
                          children: [
                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand()
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: node('2'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('3'),
                            ),
                          ],
                        ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SizedBox(
                        //       width: 50,
                        //       height: 40,
                        //       child: Transform.rotate(
                        //         angle: 2,
                        //         child: Icon(
                        //             Icons.arrow_forward
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 50,
                        //       height: 40,
                        //       child: Transform.rotate(
                        //         angle: 1.2,
                        //         child: Icon(
                        //             Icons.arrow_forward
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(width: 100,),
                        //     SizedBox(
                        //       width: 50,
                        //       height: 40,
                        //       child: Transform.rotate(
                        //         angle: 1.8,
                        //         child: Icon(
                        //             Icons.arrow_forward
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 50,
                        //       height: 40,
                        //       child: Transform.rotate(
                        //         angle: 1,
                        //         child: Icon(
                        //             Icons.arrow_forward
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     node('4'),
                        //     SizedBox(width: 50,),
                        //     node('5'),
                        //     SizedBox(width: 50,),
                        //     node('6'),
                        //     SizedBox(width: 50,),
                        //     node('7'),
                        //   ],
                        // ),

                        Row(
                          children: [
                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: node('2'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('3'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('4'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('5'),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: node('2'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('3'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('4'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('5'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('2'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('3'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('4'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('5'),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),

                            expand(),
                            leftArrow(),
                            rightArrow(),
                            expand(),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: node('2'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('3'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('4'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('5'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('2'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('3'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('4'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('5'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('2'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('3'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('4'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('5'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('2'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('3'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('4'),
                            ),
                            Expanded(
                              flex: 1,
                              child: node('5'),
                            ),
                          ],
                        ),

                        // Container(
                        //   height: 40,
                        //   child: ListView(
                        //     // mainAxisAlignment: MainAxisAlignment.center,
                        //     scrollDirection: Axis.horizontal,
                        //     children: [
                        //       SizedBox(
                        //         width: 50,
                        //         height: 40,
                        //         child: Transform.rotate(
                        //           angle: 2,
                        //           child: Icon(
                        //               Icons.arrow_forward
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 50,
                        //         height: 40,
                        //         child: Transform.rotate(
                        //           angle: 1.2,
                        //           child: Icon(
                        //               Icons.arrow_forward
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 50,
                        //         height: 40,
                        //         child: Transform.rotate(
                        //           angle: 1.8,
                        //           child: Icon(
                        //               Icons.arrow_forward
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 50,
                        //         height: 40,
                        //         child: Transform.rotate(
                        //           angle: 1,
                        //           child: Icon(
                        //               Icons.arrow_forward
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 50,
                        //         height: 40,
                        //         child: Transform.rotate(
                        //           angle: 1.8,
                        //           child: Icon(
                        //               Icons.arrow_forward
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 50,
                        //         height: 40,
                        //         child: Transform.rotate(
                        //           angle: 1,
                        //           child: Icon(
                        //               Icons.arrow_forward
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 50,
                        //         height: 40,
                        //         child: Transform.rotate(
                        //           angle: 1.8,
                        //           child: Icon(
                        //               Icons.arrow_forward
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 50,
                        //         height: 40,
                        //         child: Transform.rotate(
                        //           angle: 1,
                        //           child: Icon(
                        //               Icons.arrow_forward
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //
                        // Container(
                        //   height: 60.0,
                        //   child: ListView(
                        //     // mainAxisAlignment: MainAxisAlignment.center,
                        //     scrollDirection: Axis.horizontal,
                        //     children: [
                        //       Container(
                        //         width: 50,
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         child: Center(
                        //           child: Text('2'),
                        //         ),
                        //       ),
                        //       Container(
                        //         width: 50,
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         child: Center(
                        //           child: Text('3'),
                        //         ),
                        //       ),
                        //       Container(
                        //         width: 50,
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         child: Center(
                        //           child: Text('2'),
                        //         ),
                        //       ),
                        //       Container(
                        //         width: 50,
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         child: Center(
                        //           child: Text('3'),
                        //         ),
                        //       ),
                        //       Container(
                        //         width: 50,
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         child: Center(
                        //           child: Text('2'),
                        //         ),
                        //       ),
                        //       Container(
                        //         width: 50,
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         child: Center(
                        //           child: Text('3'),
                        //         ),
                        //       ),
                        //       Container(
                        //         width: 50,
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         child: Center(
                        //           child: Text('2'),
                        //         ),
                        //       ),
                        //       Container(
                        //         width: 50,
                        //         height: 50,
                        //         decoration: BoxDecoration(
                        //           color: Colors.blue,
                        //           borderRadius: BorderRadius.circular(50),
                        //         ),
                        //         child: Center(
                        //           child: Text('3'),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                      ],
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
                TextButton(
                  onPressed: () async{
                    // await alertBoxForPushingData(context);
                    //
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
                    BST bst = new BST();
                    if(!bst.insert(10)){
                      print('Oops');
                    }
                    if(!bst.insert(5)){
                      print('Oops');
                    }
                    if(!bst.insert(7)){
                      print('Oops');
                    }
                    if(!bst.insert(25)){
                      print('Oops');
                    }
                    if(!bst.insert(10)){
                      print('Oops');
                    }
                    if(!bst.insert(35)){
                      print('Oops');
                    }
                    if(!bst.insert(6)){
                      print('Oops');
                    }
                    print('Delete');
                    if(!bst.delete(10)){
                      print('Oops');
                    }
                    if(!bst.delete(10)){
                      print('Oops');
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                  child: Text('Insert'),
                ),
                TextButton(
                  onPressed: (){
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