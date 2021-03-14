import 'package:flutter/material.dart';
import 'package:tasks/utils/enum/TaskPriority.dart';



class PriorityTag extends StatelessWidget {
  @required final TaskPriority priority;

  PriorityTag({
    this.priority
});




  @override
  Widget build(BuildContext context) {

    if (priority == TaskPriority.none)
    return Container(width: double.minPositive, height: double.minPositive,);

    return Container(
      padding: EdgeInsets.all(4.0),
      margin: EdgeInsets.only(left: 4.0),
      decoration: BoxDecoration(
          color: priorityColor(),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Text(priority.toString().split(".")[1]),
    );
  }


  Color priorityColor(){
    switch(priority){
      case TaskPriority.high:
        return Colors.pinkAccent;
      case TaskPriority.medium:
        return Colors.deepPurple;
      case TaskPriority.low:
        return Colors.blueGrey;
      default:
        return Colors.transparent;
    }
  }



}
