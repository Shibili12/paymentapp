import 'package:flutter/material.dart';
import 'package:paymentapp/theme%20components/Palette.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
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
              Icons.car_crash,
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
