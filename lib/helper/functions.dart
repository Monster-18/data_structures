import 'package:flutter/material.dart';

import 'package:data_structures/operations/bst_operations.dart';
import 'package:data_structures/operations/avl_tree_operations.dart';
import 'package:data_structures/operations/red_black_tree_operations.dart' as rb;

//Background
BoxDecoration boxDecoration(){
  return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.lightBlueAccent[100],
          Colors.lightGreenAccent[100]
        ],
      )
  );
}


//Display Status
Widget displayStatus(BuildContext context, bool error, bool info, String errorText, String infoText){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/13.0166, //60
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
  );
}


//info
List<Widget> infoWidget(List<String> list){
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


//AppBar
AppBar appBar(String title){
  return AppBar(
    title: Text(
        title,
      style: TextStyle(
        fontStyle: FontStyle.italic
      ),
    ),
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
  );
}


//Binary Tree

//Node of a tree
Widget node(BuildContext context, String text, bool isRoot){
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width/3.92, //100
        height: MediaQuery.of(context).size.width/3.92, //100
        decoration: BoxDecoration(
          color: (isRoot)? Colors.teal: Colors.blue,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
              text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30
            ),
          ),
        ),
      ),
    ),
  );
}

//Left arrow
Widget leftArrow(BuildContext context, double angle){
  return Expanded(
    flex:1,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width/3.92, //100
          height: MediaQuery.of(context).size.width/7.84, //50,
          child: Transform.rotate(
            angle: angle,
            child: Icon(
                Icons.arrow_forward
            ),
          ),
        ),
      ),
    ),
  );
}

//Right arrow
Widget rightArrow(BuildContext context, double angle){
  return Expanded(
    flex:1,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width/3.92, //100
          height: MediaQuery.of(context).size.width/7.84, //50,
          child: Transform.rotate(
            angle: angle,
            child: Icon(
                Icons.arrow_forward
            ),
          ),
        ),
      ),
    ),
  );
}

//For empty space
Widget expand(){
  return Expanded(
    flex:1,
    child: Container(),
  );
}

//Tree
List<Widget> tree(BuildContext context, BSTOperations bstOperations){
  BNode root = bstOperations.root;

  //If tree is empty
  if(root == null){
    return [];
    //return Container();
  }

  // print('Root: ${root.data}');

  List<BNode> currentLevel = [];  //Current level nodes
  List<BNode> nextLevel = [];     //Next level nodes

  List<Widget> widgets = [];    //Total widgets of a tree

  widgets.add(SizedBox(height: 50));

  //Root node
  widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          node(context, '${root.data}', true)
        ],
      )
  );

  currentLevel.add(root);

  List<Widget> list;   //Stores Row data of arrows and nodes
  double left_angle = 2.6;
  double right_angle = 0.4;

  bool flag = true;
  while(flag){
    list = [];  //Storing arrows
    flag = false;

    //Finding next level nodes and its suitable arrows
    for(BNode node in currentLevel){
      list.add(expand());

      if(node == null){
        nextLevel.add(null);
        nextLevel.add(null);

        list.add(
            Expanded(
              flex:1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/3.92, //100
                    height: MediaQuery.of(context).size.width/7.84, //50,
                    child: Text(' '),
                  ),
                ),
              ),
            )
        );
        list.add(
            Expanded(
              flex:1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/3.92, //100
                    height: MediaQuery.of(context).size.width/7.84, //50,
                    child: Text(' '),
                  ),
                ),
              ),
            )
        );
      }else{
        if(node.left != null){
          flag = true;
          nextLevel.add(node.left);

          list.add(leftArrow(context, left_angle));
        }else{
          nextLevel.add(null);

          list.add(
              Expanded(
                flex:1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/3.92, //100
                      height: MediaQuery.of(context).size.width/7.84, //50,
                      child: Text(' '),
                    ),
                  ),
                ),
              )
          );
        }

        if(node.right != null){
          flag = true;
          nextLevel.add(node.right);

          list.add(rightArrow(context, right_angle));
        }else{
          nextLevel.add(null);

          list.add(
              Expanded(
                flex:1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/3.92, //100
                      height: MediaQuery.of(context).size.width/7.84, //50,
                      child: Text(' '),
                    ),
                  ),
                ),
              )
          );
        }
      }

      list.add(expand());
    }

    //Arrows row
    widgets.add(
        Row(
          children: list,
        )
    );

    list = [];  //Storing nodes
    for(BNode ele in nextLevel){
      if(ele == null){
        // print('null');
        list.add(
            Expanded(
              flex: 1,
              child: Text(''),
            )
        );
      }else{
        // print(ele.data);
        list.add(
            Expanded(
              flex: 1,
              child: node(context, '${ele.data}', false),
            )
        );
      }

    }

    //Nodes row
    widgets.add(
        Row(
          children: list,
        )
    );

    currentLevel = [...nextLevel];  //Copying nextLevel to currentLevel
    nextLevel = [];

    left_angle -= 0.2;
    right_angle += 0.3;
  }

  return widgets;
  // return Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: widgets,
  // );

}

//AVLTree
List<Widget> avl_tree(BuildContext context, AVLOperations avlOperations){
  Node root = avlOperations.root;

  //If tree is empty
  if(root == null){
    return [];
    //return Container();
  }

  // print('Root: ${root.data}');

  List<Node> currentLevel = [];  //Current level nodes
  List<Node> nextLevel = [];     //Next level nodes

  List<Widget> widgets = [];    //Total widgets of a tree

  widgets.add(SizedBox(height: 50));

  //Root node
  widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          node(context, '${root.data}', true)
        ],
      )
  );

  currentLevel.add(root);

  List<Widget> list;   //Stores Row data of arrows and nodes
  double left_angle = 2.6;
  double right_angle = 0.4;

  bool flag = true;
  while(flag){
    list = [];  //Storing arrows
    flag = false;

    //Finding next level nodes and its suitable arrows
    for(Node node in currentLevel){
      list.add(expand());

      if(node == null){
        nextLevel.add(null);
        nextLevel.add(null);

        list.add(
            Expanded(
              flex:1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/3.92, //100
                    height: MediaQuery.of(context).size.width/7.84, //50,
                    child: Text(' '),
                  ),
                ),
              ),
            )
        );
        list.add(
            Expanded(
              flex:1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/3.92, //100
                    height: MediaQuery.of(context).size.width/7.84, //50,
                    child: Text(' '),
                  ),
                ),
              ),
            )
        );
      }else{
        if(node.left != null){
          flag = true;
          nextLevel.add(node.left);

          list.add(leftArrow(context, left_angle));
        }else{
          nextLevel.add(null);

          list.add(
              Expanded(
                flex:1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/3.92, //100
                      height: MediaQuery.of(context).size.width/7.84, //50,
                      child: Text(' '),
                    ),
                  ),
                ),
              )
          );
        }

        if(node.right != null){
          flag = true;
          nextLevel.add(node.right);

          list.add(rightArrow(context, right_angle));
        }else{
          nextLevel.add(null);

          list.add(
              Expanded(
                flex:1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/3.92, //100
                      height: MediaQuery.of(context).size.width/7.84, //50,
                      child: Text(' '),
                    ),
                  ),
                ),
              )
          );
        }
      }

      list.add(expand());
    }

    //Arrows row
    widgets.add(
        Row(
          children: list,
        )
    );

    list = [];  //Storing nodes
    for(Node ele in nextLevel){
      if(ele == null){
        // print('null');
        list.add(
            Expanded(
              flex: 1,
              child: Text(''),
            )
        );
      }else{
        // print(ele.data);
        list.add(
            Expanded(
              flex: 1,
              child: node(context, '${ele.data}', false),
            )
        );
      }

    }

    //Nodes row
    widgets.add(
        Row(
          children: list,
        )
    );

    currentLevel = [...nextLevel];  //Copying nextLevel to currentLevel
    nextLevel = [];

    left_angle -= 0.2;
    right_angle += 0.3;
  }

  return widgets;
  // return Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: widgets,
  // );

}



//Node of red black tree
Widget rb_node(BuildContext context, String text, bool isRed){
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width/3.92, //100
        height: MediaQuery.of(context).size.width/3.92, //100,
        decoration: BoxDecoration(
          color: (isRed)? Colors.red: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30
            ),
          ),
        ),
      ),
    ),
  );
}

//RBTree
List<Widget> rb_tree(BuildContext context, rb.RBOperations rbOperations){
  rb.Node root = rbOperations.root;

  //If tree is empty
  if(root == null){
    return [];
    //return Container();
  }

  // print('Root: ${root.data}');

  List<rb.Node> currentLevel = [];  //Current level nodes
  List<rb.Node> nextLevel = [];     //Next level nodes

  List<Widget> widgets = [];    //Total widgets of a tree

  widgets.add(SizedBox(height: 50));

  //Root node
  widgets.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rb_node(context, '${root.data}', root.color)
        ],
      )
  );

  currentLevel.add(root);

  List<Widget> list;   //Stores Row data of arrows and nodes
  double left_angle = 2.6;
  double right_angle = 0.4;

  bool flag = true;
  while(flag){
    list = [];  //Storing arrows
    flag = false;

    //Finding next level nodes and its suitable arrows
    for(rb.Node node in currentLevel){
      list.add(expand());

      if(node == null){
        nextLevel.add(null);
        nextLevel.add(null);

        list.add(
            Expanded(
              flex:1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/3.92, //100
                    height: MediaQuery.of(context).size.width/7.84, //50,
                    child: Text(' '),
                  ),
                ),
              ),
            )
        );
        list.add(
            Expanded(
              flex:1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/3.92, //100
                    height: MediaQuery.of(context).size.width/7.84, //50,
                    child: Text(' '),
                  ),
                ),
              ),
            )
        );
      }else{
        if(node.left != null){
          flag = true;
          nextLevel.add(node.left);

          list.add(leftArrow(context, left_angle));
        }else{
          nextLevel.add(null);

          list.add(
              Expanded(
                flex:1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/3.92, //100
                      height: MediaQuery.of(context).size.width/7.84, //50,
                      child: Text(' '),
                    ),
                  ),
                ),
              )
          );
        }

        if(node.right != null){
          flag = true;
          nextLevel.add(node.right);

          list.add(rightArrow(context, right_angle));
        }else{
          nextLevel.add(null);

          list.add(
              Expanded(
                flex:1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/3.92, //100
                      height: MediaQuery.of(context).size.width/7.84, //50,
                      child: Text(' '),
                    ),
                  ),
                ),
              )
          );
        }
      }

      list.add(expand());
    }

    //Arrows row
    widgets.add(
        Row(
          children: list,
        )
    );

    list = [];  //Storing nodes
    for(rb.Node ele in nextLevel){
      if(ele == null){
        // print('null');
        list.add(
            Expanded(
              flex: 1,
              child: Text(''),
            )
        );
      }else{
        // print(ele.data);
        list.add(
            Expanded(
              flex: 1,
              child: rb_node(context, '${ele.data}', ele.color),
            )
        );
      }

    }

    //Nodes row
    widgets.add(
        Row(
          children: list,
        )
    );

    currentLevel = [...nextLevel];  //Copying nextLevel to currentLevel
    nextLevel = [];

    left_angle -= 0.2;
    right_angle += 0.3;
  }

  return widgets;
  // return Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: widgets,
  // );

}