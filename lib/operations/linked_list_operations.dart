class LinkedListOperations{
  List<String> list = [];

  //Inserting data atLast
  void insert(String data){
    list.add(data);
  }

  //Inserting data after an element
  bool insertAfter(String data, String after){
    int index = list.indexOf(after);    //Index of the element

    if(index == -1){    //Element not found
      return false;
    }

    list.insert(index+1, data);
    return true;
  }

  //Deleting data from the list
  bool delete(String data){
    return list.remove(data);
  }

  List<String> getList(){
    return list;
  }
}