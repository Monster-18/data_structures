class QueueOperations{
  List<String> list = [];

  //Data enters the Queue
  bool enqueue(String data){
    if(list.length > 5){    //Condition for checking Queue is full or not
      return false;
    }

    list.add(data);
    return true;
  }

  //Data leaves the Queue
  String dequeue(){
    if(list.length > 0){    //Condition for checking Queue is empty or not
      return list.removeAt(0);
    }

    return null;
  }

  List<String> getList(){
    return list;
  }
}