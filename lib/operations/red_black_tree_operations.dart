class Node{
  int data;

  Node left;
  Node right;
  Node parent;

  //Red -> True         Black -> False
  bool color;

  Node(int data) {
    this.data = data;
  }
}

class NilNode extends Node {
  NilNode() : super(0) {
    this.color = false;
  }
}

class RBOperations{
  Node _root;

  //List of data in rbtree
  List<int> _list = [];

  Node get root => _root;

  void _rotateRight(Node node) {
    Node parent = node.parent;
    Node leftChild = node.left;

    node.left = leftChild.right;
    if (leftChild.right != null) {
      leftChild.right.parent = node;
    }

    leftChild.right = node;
    node.parent = leftChild;

    _replaceParentsChild(parent, node, leftChild);
  }

  void _rotateLeft(Node node) {
    Node parent = node.parent;
    Node rightChild = node.right;

    node.right = rightChild.left;
    if (rightChild.left != null) {
      rightChild.left.parent = node;
    }

    rightChild.left = node;
    node.parent = rightChild;

    _replaceParentsChild(parent, node, rightChild);
  }

  void _replaceParentsChild(Node parent, Node oldChild, Node newChild) {
    if (parent == null) {
      _root = newChild;
    } else if (parent.left == oldChild) {
      parent.left = newChild;
    } else if (parent.right == oldChild) {
      parent.right = newChild;
    } else {
      print('Error inside replaceParentsChild method');
    }

    if (newChild != null) {
      newChild.parent = parent;
    }
  }

  void _insertNode(int key) {
    Node node = _root;
    Node parent = null;

    // Traverse the tree to the left or right depending on the key
    while (node != null) {
      parent = node;
      if (key < node.data) {
        node = node.left;
      } else if (key > node.data) {
        node = node.right;
      } else {
        print('Error inside insertNode method');
      }
    }

    // Insert new node
    Node newNode = new Node(key);
    newNode.color = true;
    if (parent == null) {
      _root = newNode;
    } else if (key < parent.data) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }
    newNode.parent = parent;

    _fixRedBlackPropertiesAfterInsert(newNode);


  }

  void _fixRedBlackPropertiesAfterInsert(Node node) {
    Node parent = node.parent;

    // Case 1: Parent is null, we've reached the root, the end of the recursion
    if (parent == null) {
      // Uncomment the following line if you want to enforce black roots (rule 2):
      node.color = false;
      return;
    }

    // Parent is black --> nothing to do
    if (!parent.color) {
      return;
    }

    // From here on, parent is red
    Node grandparent = parent.parent;

    // Case 2:
    // Not having a grandparent means that parent is the root. If we enforce black roots
    // (rule 2), grandparent will never be null, and the following if-then block can be
    // removed.
    if (grandparent == null) {
      // As this method is only called on red nodes (either on newly inserted ones - or -
      // recursively on red grandparents), all we have to do is to recolor the root black.
      parent.color = false;
      return;
    }

    // Get the uncle (may be null/nil, in which case its color is BLACK)
    Node uncle = _getUncle(parent);

    // Case 3: Uncle is red -> recolor parent, grandparent and uncle
    if (uncle != null && uncle.color) {
      parent.color = false;
      grandparent.color = true;
      uncle.color = false;

      // Call recursively for grandparent, which is now red.
      // It might be root or have a red parent, in which case we need to fix more...
      _fixRedBlackPropertiesAfterInsert(grandparent);
    }

    // Parent is left child of grandparent
    else if (parent == grandparent.left) {
      // Case 4a: Uncle is black and node is left->right "inner child" of its grandparent
      if (node == parent.right) {
        _rotateLeft(parent);

        // Let "parent" point to the new root node of the rotated sub-tree.
        // It will be recolored in the next step, which we're going to fall-through to.
        parent = node;
      }

      // Case 5a: Uncle is black and node is left->left "outer child" of its grandparent
      _rotateRight(grandparent);

      // Recolor original parent and grandparent
      parent.color = false;
      grandparent.color = true;
    }

    // Parent is right child of grandparent
    else {
      // Case 4b: Uncle is black and node is right->left "inner child" of its grandparent
      if (node == parent.left) {
        _rotateRight(parent);

        // Let "parent" point to the new root node of the rotated sub-tree.
        // It will be recolored in the next step, which we're going to fall-through to.
        parent = node;
      }

      // Case 5b: Uncle is black and node is right->right "outer child" of its grandparent
      _rotateLeft(grandparent);

      // Recolor original parent and grandparent
      parent.color = false;
      grandparent.color = true;
    }
  }

  Node _getUncle(Node parent) {
    Node grandparent = parent.parent;
    if (grandparent.left == parent) {
      return grandparent.right;
    } else if (grandparent.right == parent) {
      return grandparent.left;
    } else {
      print('Error inside getUncle method');
    }
  }

  void _deleteNode(int key) {
    Node node = _root;

    // Find the node to be deleted
    while (node != null && node.data != key) {
      // Traverse the tree to the left or right depending on the key
      if (key < node.data) {
        node = node.left;
      } else {
        node = node.right;
      }
    }

    // Node not found?
    if (node == null) {
      return;
    }

    // At this point, "node" is the node to be deleted

    // In this variable, we'll store the node at which we're going to start to fix the R-B
    // properties after deleting a node.
    Node movedUpNode;
    bool deletedNodeColor;

    // Node has zero or one child
    if (node.left == null || node.right == null) {
      movedUpNode = _deleteNodeWithZeroOrOneChild(node);
      deletedNodeColor = node.color;
    }

    // Node has two children
    else {
      // Find minimum node of right subtree ("inorder successor" of current node)
      Node inOrderSuccessor = _findMinimum(node.right);

      // Copy inorder successor's data to current node (keep its color!)
      node.data = inOrderSuccessor.data;

      // Delete inorder successor just as we would delete a node with 0 or 1 child
      movedUpNode = _deleteNodeWithZeroOrOneChild(inOrderSuccessor);
      deletedNodeColor = inOrderSuccessor.color;
    }

    if (deletedNodeColor == false) {
      _fixRedBlackPropertiesAfterDelete(movedUpNode);

      // Remove the temporary NIL node
      if (movedUpNode.runtimeType == NilNode) {
        _replaceParentsChild(movedUpNode.parent, movedUpNode, null);
      }
    }
  }

  Node _deleteNodeWithZeroOrOneChild(Node node) {
    // Node has ONLY a left child --> replace by its left child
    if (node.left != null) {
      _replaceParentsChild(node.parent, node, node.left);
      return node.left; // moved-up node
    }

    // Node has ONLY a right child --> replace by its right child
    else if (node.right != null) {
      _replaceParentsChild(node.parent, node, node.right);
      return node.right; // moved-up node
    }

    // Node has no children -->
    // * node is red --> just remove it
    // * node is black --> replace it by a temporary NIL node (needed to fix the R-B rules)
    else {
      Node newChild = node.color == false ? new NilNode() : null;
      _replaceParentsChild(node.parent, node, newChild);
      return newChild;
    }
  }

  Node _findMinimum(Node node) {
  while (node.left != null) {
  node = node.left;
  }
  return node;
  }


  void _fixRedBlackPropertiesAfterDelete(Node node) {
  // Case 1: Examined node is root, end of recursion
  if (node == _root) {
  // Uncomment the following line if you want to enforce black roots (rule 2):
  node.color = false;
  return;
  }

  Node sibling = _getSibling(node);

  // Case 2: Red sibling
  if (sibling.color == true) {
  _handleRedSibling(node, sibling);
  sibling = _getSibling(node); // Get new sibling for fall-through to cases 3-6
  }

  // Cases 3+4: Black sibling with two black children
  if (_isBlack(sibling.left) && _isBlack(sibling.right)) {
  sibling.color = true;

  // Case 3: Black sibling with two black children + red parent
  if (node.parent.color == true) {
  node.parent.color = false;
  }

  // Case 4: Black sibling with two black children + black parent
  else {
  _fixRedBlackPropertiesAfterDelete(node.parent);
  }
  }

  // Case 5+6: Black sibling with at least one red child
  else {
  _handleBlackSiblingWithAtLeastOneRedChild(node, sibling);
  }
  }

  Node _getSibling(Node node) {
    Node parent = node.parent;
    if (node == parent.left) {
      return parent.right;
    }else if (node == parent.right) {
      return parent.left;
    } else {
      print('Error inside getSibling method');
    }
  }

  bool _isBlack(Node node) {
  return node == null || node.color == false;
  }


  void _handleRedSibling(Node node, Node sibling) {
  // Recolor...
  sibling.color = false;
  node.parent.color = true;

  // ... and rotate
  if (node == node.parent.left) {
  _rotateLeft(node.parent);
  } else {
  _rotateRight(node.parent);
  }
  }

  void _handleBlackSiblingWithAtLeastOneRedChild(Node node, Node sibling) {
  bool nodeIsLeftChild = node == node.parent.left;

  // Case 5: Black sibling with at least one red child + "outer nephew" is black
  // --> Recolor sibling and its child, and rotate around sibling
  if (nodeIsLeftChild && _isBlack(sibling.right)) {
  sibling.left.color = false;
  sibling.color = true;
  _rotateRight(sibling);
  sibling = node.parent.right;
  } else if (!nodeIsLeftChild && _isBlack(sibling.left)) {
  sibling.right.color = false;
  sibling.color = true;
  _rotateLeft(sibling);
  sibling = node.parent.left;
  }

  // Fall-through to case 6...

  // Case 6: Black sibling with at least one red child + "outer nephew" is red
  // --> Recolor sibling + parent + sibling's child, and rotate around parent
  sibling.color = node.parent.color;
  node.parent.color = false;
  if (nodeIsLeftChild) {
  sibling.right.color = false;
  _rotateLeft(node.parent);
  } else {
  sibling.left.color = false;
  _rotateRight(node.parent);
  }
  }



  //Returns height of the tree
  int _height(Node temp){
    if(temp == null){
      return 0;
    }

    int left = _height(temp.left);
    int right = _height(temp.right);

    return (left > right)? left+1: right+1;
  }

  //Insert data
  int insert(int data){
    if(_list.contains(data)){
      return 0;
    }

    _insertNode(data);
    _list.add(data);

    if(_height(_root) > 5){
      delete(data);
      return 2;
    }else{
      return 1;
    }
  }

  //Delete data
  bool delete(int n){
    if(!_list.contains(n)){
      return false;
    }

    _deleteNode(n);

    _list.remove(n);

    return true;
  }


  // void inOrder(Node temp){
  // if(temp == null){
  // return;
  // }
  //
  // inOrder(temp.left);
  // System.out.println(temp.data + " " + temp.color);
  // inOrder(temp.right);
  // }

}
