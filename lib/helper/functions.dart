import 'package:flutter/material.dart';

import 'package:data_structures/operations/bst_operations.dart';

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


//AppBar
AppBar appBar(String title){
  return AppBar(
    title: Text(title),
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
Widget node(String text){
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue,
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
Widget leftArrow(double angle){
  return Expanded(
    flex:1,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 100,
          height: 50,
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
Widget rightArrow(double angle){
  return Expanded(
    flex:1,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 100,
          height: 50,
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
List<Widget> tree(BSTOperations bstOperations){
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
          node('${root.data}')
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
                    width: 100,
                    height: 50,
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
                    width: 100,
                    height: 50,
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

          list.add(leftArrow(left_angle));
        }else{
          nextLevel.add(null);

          list.add(
              Expanded(
                flex:1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      height: 50,
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

          list.add(rightArrow(right_angle));
        }else{
          nextLevel.add(null);

          list.add(
              Expanded(
                flex:1,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      height: 50,
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
              child: node('${ele.data}'),
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