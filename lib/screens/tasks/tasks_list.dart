import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/screens/tasks/task_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/network/local/firebase.dart';
import '../../styles/colors.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              selectedDate = date;
              setState(() {});
            },
            leftMargin: 20,
            monthColor: Theme.of(context).colorScheme.onSurface,
            dayColor: Theme.of(context).colorScheme.onSurface,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Theme.of(context).primaryColor,
            dotsColor: Colors.white,
            selectableDayPredicate: (date) => true,
            locale: 'en',
          ),
          StreamBuilder<QuerySnapshot<TaskData>>(
              stream: getTaskFromFirebase(selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }
                var tasks =
                    snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
                if (tasks.isEmpty) {
                  return Center(child: Text("No Data"));
                }
                return Expanded(
                  child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (c, index) {
                        return TaskItem(tasks[index]);
                      }),
                );
              })
        ],
      ),
    );
  }
}
