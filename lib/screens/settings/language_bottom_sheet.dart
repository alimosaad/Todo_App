import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../providers/my_provider.dart';
import '../../styles/colors.dart';

class LanguageBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color: provider.mode == ThemeMode.light ? greenBackground : colorBlack,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changelang('en');

              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Icon(
                  Icons.done,
                  size: 30,
                  color: provider.languageCode == 'en'
                      ? Theme.of(context).colorScheme.onBackground
                      : Colors.transparent,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              provider.changelang('ar');
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Icon(
                    Icons.done,
                    size: 30,
                    color: provider.languageCode == 'ar'
                        ? primaryColor
                        : Colors.transparent)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
