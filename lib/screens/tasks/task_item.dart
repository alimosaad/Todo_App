import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/shared/network/local/firebase.dart';
import 'package:todo_app/styles/colors.dart';

class TaskItem extends StatelessWidget {
  TaskData task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: BehindMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            deleteTaskFromFirebase(task.id);
          },
          borderRadius: BorderRadius.circular(12),
          backgroundColor: colorRed,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
        SlidableAction(
          onPressed: (context) {},
          borderRadius: BorderRadius.circular(12),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ]),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              width: 3,
              height: 50,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  task.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(task.description),
              ],
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(6)),
              child: Image.asset("assets/done.png"),
            )
          ],
        ),
      ),
    );
  }
}
