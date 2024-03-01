import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymentapp/notification_page.dart';
import 'package:paymentapp/theme%20components/Palette.dart';

class Mypayments extends StatefulWidget {
  const Mypayments({super.key});

  @override
  State<Mypayments> createState() => _MypaymentsState();
}

class _MypaymentsState extends State<Mypayments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Payments"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Notificationpage()));
            },
            icon: const Badge(
              label: Text('0'),
              child: Icon(Icons.notification_add_outlined),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 65,
                  width: 168,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Palette.ToDoGreen,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total Payment",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        "10,000",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 65,
                  width: 168,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Palette.ToDoDeepRed,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Payment Pending",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        "8,000",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "Recipt No:0000$index",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "+ ${index + 1},000",
                        style: const TextStyle(
                            color: Palette.ToDoGreen,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.download_outlined,
                            color: Palette.ToDoDeepRed,
                          ))
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(),
                );
              },
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
