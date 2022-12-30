import 'package:flutter/material.dart';
import 'package:todo_app/layout/add_bottomsheet.dart';
import '../screens/settings/settings.dart';
import '../screens/tasks/tasks_list.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,     //to make notch with the same color of body
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
          color: Colors.white,
          width: 3,
        )),
        onPressed: () {
          showaddTaskBottomSheet();
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 7,
        shape: CircularNotchedRectangle(),

        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex:currentIndex ,
          onTap: (index){
            currentIndex=index;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 30,
                ),
                label: 'Lists'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: 'Settins'),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [TasksList(), SettingsScreen()];

  void showaddTaskBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => AddTaskSheet());
  }
}
