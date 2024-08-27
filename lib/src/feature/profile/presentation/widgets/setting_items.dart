import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key, required this.settingType, required this.settingsOption, required this.image,
  });
  final  String settingType;
  final String image;
  final String settingsOption;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data:  ThemeData().copyWith(dividerColor:Colors.transparent ),
      child: ExpansionTile(
        title: Text(settingType),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Image.asset(image),
                      Text(settingsOption),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Image.asset(image),
                      Text(settingsOption),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
