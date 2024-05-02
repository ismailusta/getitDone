import 'package:app/models/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final Text _greenText = const Text(
    "Green",
    style: TextStyle(color: Colors.green),
  );
  final Text _redText = const Text(
    "Red",
    style: TextStyle(color: Colors.red),
  );
  @override
  Widget build(BuildContext context) {
    bool value = Provider.of<themeData>(context).getisGreen;
    return Card(
      child: SwitchListTile(
        activeColor: Theme.of(context).primaryColor,
        activeTrackColor: const Color.fromARGB(255, 197, 187, 161),
        title: const Text(
          "Change Theme",
          style: TextStyle(color: Colors.black),
        ),
        subtitle: value ? _greenText : _redText,
        value: value,
        onChanged: (bool value) {
          setState(
            () {
              value = value;
            },
          );
          Provider.of<themeData>(context, listen: false).changeTheme(value);
        },
      ),
    );
  }
}
