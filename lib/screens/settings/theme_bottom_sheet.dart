import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/styles/colors.dart';

import '../../providers/my_provider.dart';
import '../../styles/MyThemeData.dart';

class ThemeModeBottomSheet extends StatelessWidget {
  const ThemeModeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Container(
      color: provider.mode == ThemeMode.light ? greenBackground : colorBlack,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);

              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    'light',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Spacer(),
                  Icon(
                    Icons.done,
                    size: 30,
                    color: provider.mode == ThemeMode.light
                        ? primaryColor
                        : colorBlack,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);

              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text('dark', style: Theme.of(context).textTheme.titleSmall),
                  Spacer(),
                  Icon(Icons.done,
                      size: 30,
                      color: provider.mode == ThemeMode.dark
                          ? primaryColor
                          : greenBackground)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
