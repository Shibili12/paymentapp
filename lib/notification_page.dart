import 'package:flutter/material.dart';
import 'package:paymentapp/theme%20components/Palette.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  var icons = [
    Icons.energy_savings_leaf,
    Icons.car_crash,
    Icons.check_circle_outline,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Bus No : G23975$index has been cancelled due to Bad weather",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("$index hour ago"),
            leading: Icon(
              icons[index],
              color: Palette.ToDoDeepRed,
            ),
            trailing: Icon(Icons.more_vert),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 3,
      ),
    );
  }
}
