import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                "data",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text("data"),
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
    );
  }
}
