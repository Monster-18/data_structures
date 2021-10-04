//Node of BST
class BNode{
  int data;
  BNode left, right;

  BNode(int n){
    data = n;
    left = right = null;
  }
}

class BSTOperations{
  BNode _root = null;

  //List of data in bst
  List<int> list = [];

  //Return root
  BNode get root => _root;

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

    // inOrder(_root);

    return true;
  }


  //Returns inorder predecessor
  BNode _inorderPredecessor(BNode temp){
    if(temp == null){
      return null;
    }
    if(temp.right == null){
      return temp;
    }

    return _inorderPredecessor(temp.right);
  }

  BNode _swapWithInorderPredecessor(BNode temp, n){
    BNode pre = _inorderPredecessor(temp.left);
    int data = pre.data;
    pre.data = temp.data;
    temp.data = data;

    BNode old = temp, t = temp.left;
    if(t.data == n){
      if(t.left == null){
        old.left = null;
      }else{
        old.left = t.left;
      }
    }else {
      old = t;
      t = t.right;
      while(true){
        if(t.data == n){
          if(t.left == null){
            old.right = null;
          }else{
            old.right = t.left;
          }
          break;
        }

        old = t;
        t = t.right;
      }
    }
    return temp;
  }


  //Returns inorder successor
  BNode _inorderSuccessor(BNode temp){

    if(temp.left == null){
      return temp;
    }

    return _inorderSuccessor(temp.left);
  }

  BNode _swapWithInorderSuccessor(BNode temp, n){
    BNode pre = _inorderSuccessor(temp.right);
    int data = pre.data;
    pre.data = temp.data;
    temp.data = data;

    BNode old = temp, t = temp.right;
    if(t.data == n){
      if(t.right == null){
        old.right = null;
      }else{
        old.right = t.right;
      }
    }else {
      old = t;
      t = t.left;
      while(true){
        if(t.data == n){
          if(t.right == null){
            old.left = null;
          }else{
            old.left = t.right;
          }
          break;
        }

        old = t;
        t = t.left;
      }
    }
    return temp;
  }


  //Delete node in BST
  BNode _deleteNode(BNode temp, int n){
    if(temp == null){
      return null;
    }

    if(n < temp.data){
      temp.left = _deleteNode(temp.left, n);
    }else if(n > temp.data){
      temp.right = _deleteNode(temp.right, n);
    }else{
      int count = 0;
      if(temp.left != null){
        count++;
      }
      if(temp.right != null){
        count++;
      }

      switch(count){
        case 0: return null;
        case 1: if(temp.left != null) {
          return _swapWithInorderPredecessor(temp, n);
        }

        return _swapWithInorderSuccessor(temp, n);
        case 2:
          return _swapWithInorderPredecessor(temp, n);
      }
    }

    return temp;
  }

  bool delete(int n){
    if(!list.contains(n)){
      return false;
    }

    _root = _deleteNode(_root, n);
    list.remove(n);
    // inOrder(_root);
    // print('');
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