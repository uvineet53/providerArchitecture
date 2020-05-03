import 'package:flutter/material.dart';
import 'package:helloworld/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Units"),
                DropdownButton<String>(
                  value: settingsProvider.units,
                  onChanged: (String value) {
                    settingsProvider.setUnits(value);
                  },
                  items: <String>['Imperial', "Metric"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Wax Lines"),
                Container(
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: <Widget>[
                      FilterChip(
                          label: Text(
                            'Swix',
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          selected: (settingsProvider.waxLines.contains('Swix'))
                              ? true
                              : false,
                          onSelected: (bool value) {
                            if (value == true) {
                              settingsProvider.addWaxLines('Swix');
                            } else {
                              settingsProvider.removeWaxLines('Swix');
                            }
                          }),
                      FilterChip(
                          label: Text(
                            'Toco',
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          selected: (settingsProvider.waxLines.contains('Toco'))
                              ? true
                              : false,
                          onSelected: (bool value) {
                            if (value == true) {
                              settingsProvider.addWaxLines('Toco');
                            } else {
                              settingsProvider.removeWaxLines('Toco');
                            }
                          })
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
