import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'file:///F:/Projects/Flutter/tasks/lib/utils/enum/TaskStatus.dart';
import 'package:tasks/ui/widgets/PriorityTag.dart';
import 'package:tasks/utils/enum/TaskPriority.dart';


class TaskListTile extends StatelessWidget {
  @required TaskStatus status;
  @required String title;
  String subtitle;
  IconData icon;
  

  @required DateTime dueDate;


  TaskListTile({
    this.status,
    this.icon,
    this.title,
    this.dueDate
});


  @override
  Widget build(BuildContext context) {

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            leading: CircleAvatar(
              backgroundColor: setStatusColor(status),
              child: Icon(icon),
            ),
            title: Row(
              children: [
                Text(title),
                PriorityTag(priority: TaskPriority.medium,)
              ],
            ),
            subtitle: null,


            trailing: Column(
              children: [
                Text("Due date"),
                Text("Thurs 3 Mar 2020"),
                Text("8 PM"),
              ],
            ),
            // subtitle: Text(subtitle),

          ),
          Divider(
            indent: 12.0,
            endIndent: 12.0,
          )
        ],
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Complete',
          color: Colors.green,
          icon: Icons.check_circle_outline,
          onTap: () => _showSnackBar('Complete'),
        ),

        IconSlideAction(
          caption: 'Pending',
          color: Colors.blue,
          icon: Icons.watch_later_outlined,
          onTap: () => _showSnackBar('pending'),
        ),

        IconSlideAction(
          caption: 'Ongoing',
          color: Colors.indigo,
          icon: Icons.pending,
          onTap: () => _showSnackBar('Share'),
        ),

      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.black45,
          icon: Icons.edit,
          onTap: () => _showSnackBar('More'),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }




  Color setStatusColor(TaskStatus status){
    switch(status){
      case TaskStatus.canceled:
        return Colors.grey;
        break;
        
      case TaskStatus.ongoing:
        return Colors.yellow;
        break;
        
      case TaskStatus.complete:
        return Colors.green;
        break;
        
      case TaskStatus.pending:
        return Colors.indigo;
        break;
        
      default:
        return Colors.red;
        break;
    }
  }
  
  
  void _showSnackBar(String some){}

}



