class StackOperations{
  List<String> list = [];

  bool push(String data){
    if(list.length > 5){      //Overflow Condition
      return false;
    }

    list.insert(0, data);
    return true;
  }

  String pop(){
    if(list.isEmpty){       //Underflow Condition
      return null;
    }

    String popedElement = list.first;
    list.removeAt(0);
    return popedElement;
  }

  List<String> getList(){
    return list;
  }
}