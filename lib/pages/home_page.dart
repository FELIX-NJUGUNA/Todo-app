import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utilities/dialog_box.dart';

import '../utilities/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();


  @override
  void initState() {
    // if the first time opening the app, create default data
    if(_myBox.get("TODOLIST")== null){
      db.createInitalData();
    } else{
      db.loadData();
    }
    super.initState();
  }


  //text controller
  final _controller = TextEditingController();



  // check box was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });

    db.updateDatabase();

  }


  // save new task

  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();

  }


  // new task

  void createNewTask(){
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller ,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop() ,
          );
        }
    );
  }

  // delete task function
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        title: const Text("TO DO"),
        elevation: 0,

      ),


      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask  ,
        child: Icon(Icons.add,color: Colors.deepPurple,),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
              deleteFunction: (context) => deleteTask,
          );
        },


      ),

    );
  }
}
