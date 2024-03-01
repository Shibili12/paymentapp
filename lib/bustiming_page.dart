import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymentapp/notification_page.dart';
import 'package:paymentapp/theme%20components/Palette.dart';

import 'package:timelines/timelines.dart';

class Bustimingpage extends StatefulWidget {
  const Bustimingpage({super.key});

  @override
  State<Bustimingpage> createState() => _BustimingpageState();
}

class _BustimingpageState extends State<Bustimingpage> {
  var places = ["Dubai", "Al lissali", "Lahbab", "Al madam", "Shawka"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Timing"),
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
          Container(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Routes",
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Palette.ToDoDeepRed,
                    )),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      collapsedTextColor: Colors.black,
                      textColor: Colors.black,
                      collapsedIconColor: Palette.ToDoDeepRed,
                      iconColor: Palette.ToDoDeepRed,
                      title: Text(
                        "G9123$index",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_down),
                      children: [
                        Container(
                          height: 90,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Timeline.tileBuilder(
                                theme: TimelineThemeData(
                                    nodePosition: 0.5,
                                    indicatorPosition: 1,
                                    direction: Axis.horizontal,
                                    color: Palette.ToDoDeepRed),
                                builder: TimelineTileBuilder.fromStyle(
                                  contentsAlign: ContentsAlign.basic,
                                  contentsBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '0$index:00 AM',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  oppositeContentsBuilder: (context, index) =>
                                      Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      places[index],
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                  itemCount: 5,
                                  // nodePositionBuilder: (context, index) => 0.5,
                                  indicatorPositionBuilder: (context, index) {
                                    if (index == 4) {
                                      return 1;
                                    } else if (index == 0) {
                                      return 0;
                                    } else {
                                      return 0.3;
                                    }
                                  },
                                  itemExtentBuilder: (context, index) => 70,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  })),
        ],
      ),
    );
  }
}
