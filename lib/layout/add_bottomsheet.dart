import 'package:flutter/material.dart';
import 'package:todo_app/styles/MyThemeData.dart';
import 'package:todo_app/styles/colors.dart';

class AddTaskSheet extends StatefulWidget {
  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  var titleControler = TextEditingController(); // to control TFF
  var discriptionControler = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime SelectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add New Task",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colorBlack,
                ),
          ),
          SizedBox(
            height: 15,
          ),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: titleControler,
                    validator: (text) {
                      if (text != null && text.isEmpty) {
                        return 'Please enter task title';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text("Title"),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: discriptionControler,
                    validator: (text) {
                      if (text != null && text.isEmpty) {
                        return 'Please enter task description';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text("Discription"),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Select date",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: colorBlack,
                        ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      DisplayCleander(context);
                    },
                    child: Text(
                      '${SelectedDate.year}/${SelectedDate.month}/${SelectedDate.day}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: primaryColor,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: Text("Add Task")),
                ],
              )),
        ],
      ),
    );
  }

  Future<void> DisplayCleander(BuildContext context) async {
    DateTime? choosen = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    setState(() {
      if (choosen == null) return;
      SelectedDate = choosen;
    });
  }
}
