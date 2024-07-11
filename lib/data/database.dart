import 'package:hive/hive.dart';

class ToDoDatabase{


  List toDoList = [];

  // reference mybox
  final _myBox = Hive.box('mybox');

  // run the method for the first time opening the app
  void createInitalData(){
    toDoList = [
      ["Code", false],
      ["Design poster", false],
    ];

  }


  // load data from the database
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }


  // update the database
   void updateDatabase(){
      _myBox.put("TODOLIST", toDoList);
   }

}