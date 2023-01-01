import 'package:flutter/material.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'English',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Icon(
                  Icons.done,
                  size: 30,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'arabic',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(),
                ),
                Icon(
                  Icons.done,
                  size: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
