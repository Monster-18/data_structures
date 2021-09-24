import 'dart:io';

class BNode{
  int data;
  BNode left, right;

  BNode(int n){
    data = n;
    left = right = null;
  }
}

class BST{
  BNode _root = null;

  //List of data in bst
  List<int> list = [];

  //Insert node in BST
  BNode _insertNode(BNode temp, int n){
    if(temp == null){
      BNode newnode = new BNode(n);
      return newnode;
    }

    if(n > temp.data){
      temp.right = _insertNode(temp.right, n);
    }else{
      temp.left = _insertNode(temp.left, n);
    }

    return temp;
  }


  bool insert(int n){
    if(list.contains(n)){
      return false;
    }

    list.add(n);
    _root = _insertNode(_root, n);

    inOrder(_root);
    print('');

    return true;
  }

  //Inorder display
  void inOrder(BNode temp){
    if(temp == null){
      return;
    }

    inOrder(temp.left);
    print('${temp.data}');
    inOrder(temp.right);
  }
}