import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ToDoTile extends StatelessWidget {
  final String taskName;

  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deleteFunction;

 ToDoTile({
   super.key,
   required this.taskName,
   required this.taskCompleted,
   required this.onChanged,
    required this.deleteFunction
 });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, top: 22),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
              SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                backgroundColor: Colors.red.shade200,
                borderRadius: BorderRadius.circular(12),

              )

          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              // check box
              Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black54,),
        
              // text
              Text(taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      :TextDecoration.none
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
