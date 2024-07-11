import 'package:flutter/material.dart';
import 'package:todo_app/utilities/my_button.dart';


class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;

  VoidCallback onCancel;

  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content:  Container(
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input

              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add new task"
                ),
              ),

              //buttons Save and Cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  // save button
                  MyButton(text: "Save", onPressed: onSave),

                  const SizedBox(width: 4,),
                  // cancel button
                  MyButton(text: "Cancel", onPressed: onCancel
                  )
                ],
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
