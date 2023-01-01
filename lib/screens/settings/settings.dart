import 'package:flutter/material.dart';
import 'package:todo_app/screens/settings/theme_bottom_sheet.dart';
import 'package:todo_app/styles/MyThemeData.dart';

import '../../styles/colors.dart';
import 'language_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Language',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "en",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Mode",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showThemeModeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "Light",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showThemeModeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeModeBottomSheet();
        });
  }
}
