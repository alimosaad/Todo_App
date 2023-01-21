import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/screens/tasks/update_task.dart';
import 'package:todo_app/shared/network/local/firebase.dart';
import 'package:todo_app/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          label: AppLocalizations.of(context)!.delete,
        ),
        SlidableAction(
          onPressed: (context) {
            Navigator.pushNamed(context, UpdateScreen.routeName,
                arguments: task);
          },
          borderRadius: BorderRadius.circular(12),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: AppLocalizations.of(context)!.edit,
        ),
      ]),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              width: 3,
              height: 50,
              color: task.isDone ? colorGreen : Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              children: [
                Text(
                  task.title,
                  style: task.isDone
                      ? Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: colorGreen)
                      : Theme.of(context).textTheme.titleMedium,
                ),
                Text(task.description,
                    style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
            Spacer(
              flex: 2,
            ),
            InkWell(
              onTap: () {
                if (!task.isDone) {
                  UpdateDone(task);
                }
              },
              child: task.isDone
                  ? Text(
                      "Done!",
                      style: TextStyle(color: colorGreen),
                    )
                  : Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: Image.asset("assets/done.png"),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
