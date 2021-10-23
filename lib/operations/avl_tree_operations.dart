import 'dart:math';

//Node of AVL Tree
class Node{
  int data, height;
  Node left, right;

  Node(int n){
    data = n;
    left = right = null;
    height = 0;
  }
}

class AVLOperations {
  Node _root = null;

  //List of data in avl
  List<int> list = [];

  //Return root
  Node get root => _root;

  //Returns the height of a node
  int _height(Node temp){
    return temp == null? -1: temp.height;
  }

  //Updates height of a node
  void _updateHeight(Node temp){
    int leftHeight = _height(temp.left);
    int rightHeight = _height(temp.right);

    temp.height = max(leftHeight, rightHeight)+1;
  }

  //Right Rotation
  Node _rightRotation(Node temp){
    Node leftNode = temp.left;

    temp.left = leftNode.right;
    leftNode.right = temp;

    _updateHeight(temp);
    _updateHeight(leftNode);
    return leftNode;
  }

  //Left Rotation
  Node _leftRotation(Node temp){
    Node rightNode = temp.right;

    temp.right = rightNode.left;
    rightNode.left = temp;

    _updateHeight(temp);
    _updateHeight(rightNode);

    return rightNode;
  }

  //Returns the balance factor
  int _balanceFactor(Node temp){
    return _height(temp.left) - _height(temp.right);
  }

  //CheckBalance of the AVL tree
  Node _checkBalance(Node temp){
    int balanceFactor = _balanceFactor(temp);

    //Left weighted
    if(balanceFactor > 1){
      int bf = _balanceFactor(temp.left);
      if(bf >= 0){
        //Right Rotation
        temp = _rightRotation(temp);
      }else{
        //Left Right Rotation
        temp.left = _leftRotation(temp.left);
        temp = _rightRotation(temp);
      }
    }

    //Right weighted
    if(balanceFactor < -1){
      int bf = _balanceFactor(temp.right);
      if(bf <= 0){
        //Left Rotation
        temp = _leftRotation(temp);
      }else{
        //Right Left Rotation
        temp.right = _rightRotation(temp.right);
        temp = _leftRotation(temp);
      }
    }

    return temp;
  }

  //Insert node in AVL
  Node _insertNode(Node temp, int n){
    if(temp == null){
      return new Node(n);
    }

    if(n < temp.data){
      temp.left = _insertNode(temp.left, n);
    }
    if(n > temp.data){
      temp.right = _insertNode(temp.right, n);
    }

    _updateHeight(temp);
    temp = _checkBalance(temp);
    return temp;
  }


  int insert(int n){
    if(list.contains(n)){
      return 0;
    }

    _root = _insertNode(_root, n);
    list.add(n);

    if(_height(_root) < 5){
      return 1;
    }else{
      delete(n);
      return 2;
    }
  }



  //Remove Inorder Predecessor and stores the predecessor data
  int predecessorData = 0;
  Node _findAndDeleteInOrderPredecessor(Node temp){
    if(temp.right == null){
      predecessorData = temp.data;
      return temp.left;
    }

    temp.right = _findAndDeleteInOrderPredecessor(temp.right);
    return temp;
  }

  //Delete a node in AVL
  Node _deleteNode(Node temp, int n){
    if(temp == null){
      return null;
    }

    if(temp.data == n){
      int count = 0;

      if(temp.left != null){
        count++;
      }
      if(temp.right != null){
        count++;
      }

      switch(count){
        case 0:
          return null;
        case 1:
          if(temp.left != null){
            return temp.left;
          }
          return temp.right;
        case 2:
          temp.left = _findAndDeleteInOrderPredecessor(temp.left);
          temp.data = predecessorData;
          return temp;
      }

      return null;
    }

    if(n < temp.data){
      temp.left = _deleteNode(temp.left, n);
    }
    if(n > temp.data){
      temp.right = _deleteNode(temp.right, n);
    }

    _updateHeight(temp);
    temp = _checkBalance(temp);
    return temp;
  }


  bool delete(int n){
    if(!list.contains(n)){
      return false;
    }

    _root = _deleteNode(_root, n);
    _root = _checkBalance(_root);

    list.remove(n);
    // inOrder(_root);
    // print('');
    return true;
  }

  //Inorder Display
  void inOrder(Node temp){
    if(temp == null){
      return;
    }

    inOrder(temp.left);
    print('${temp.data} -> ${temp.height}');
    inOrder(temp.right);
  }

}
