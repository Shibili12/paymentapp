import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paymentapp/theme%20components/Palette.dart';

class Vacation extends StatefulWidget {
  const Vacation({Key? key}) : super(key: key);

  @override
  State<Vacation> createState() => _VacationState();
}

class _VacationState extends State<Vacation> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Vacation/Rejoin',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Icon(
              Icons.notifications_outlined,
              color: Colors.white,
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.grey)),
                                hintText: 'From',
                                suffixIcon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                ))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: TextField(
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.grey)),
                                hintText: 'To',
                                suffixIcon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                ))),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: 400,
                  child: TextField(
                      decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey)),
                    hintText: 'No of Days',
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Palette.crm),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.only(right: 5, left: 5, top: 1, bottom: 1)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 13,
                    ))),
                onPressed: () {},
                child: Text('Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
