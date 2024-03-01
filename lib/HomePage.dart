import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:flutter_stripe/flutter_stripe.dart';

//import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:http/http.dart' as http;
import 'package:paymentapp/notification_page.dart';
import 'package:paymentapp/payment_historypage.dart';
import 'package:paymentapp/theme%20components/Palette.dart';

import 'Vacation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List GridLabel = [
    'Make Payment',
    'Payment Statement',
    'Notification',
    'Greetings',
    'Bus Timing',
    'Feedback',
    'Vacation / Rejoin'
  ];
  Size? size;
  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            //  iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
            //backgroundColor: Palette.ToDoRed,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.account_circle,
                  size: 35,
                ),
              ),
            ],
          ),
          drawer: Drawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 26,
                  // width: size!.width,
                  color: Palette.ToDoDeepRed,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '   Welcome Abhilash',
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
                GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    shrinkWrap: true,
                    childAspectRatio: 1 / 0.6,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          paymentDialog();
                          //Config.dealerOrderEdit = false;
                          /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  NewOrder()));*/
                        },
                        child: flutter.Card(
                          margin: EdgeInsets.all(1.0),
                          elevation: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              // border: Border.all(
                              //   color: Colors.white
                              // ),
                              // boxShadow: [
                              //   BoxShadow(blurRadius:0.5,),
                              // ]
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.payment,
                                        color: Colors.red, size: 50)
                                    /*Image.asset('assets/images/open-box.png',color: Colors.white,height: 50,
                                  width: 50)*/
                                    ,
                                  ),
                                  Text(
                                    GridLabel[0],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Mypayments()));
                          //Config.dealerOrderEdit = false;
                          /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  NewOrder()));*/
                        },
                        child: flutter.Card(
                          margin: EdgeInsets.all(1.0),
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              // border: Border.all(
                              //   color: Colors.white
                              // ),
                              // boxShadow: [
                              //   BoxShadow(blurRadius:0.5,),
                              // ]
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Icon(Icons.receipt_long,
                                          color: Colors.red, size: 50)),
                                  Text(
                                    GridLabel[1],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Notificationpage()));
                          //Config.dealerOrderEdit = false;
                          /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  NewOrder()));*/
                        },
                        child: flutter.Card(
                          margin: EdgeInsets.all(1.0),
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              // border: Border.all(
                              //   color: Colors.white
                              // ),
                              // boxShadow: [
                              //   BoxShadow(blurRadius:0.5,),
                              // ]
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.notifications_outlined,
                                        color: Colors.red, size: 50),
                                  ),
                                  Text(
                                    GridLabel[2],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          greeting();
                          //Config.dealerOrderEdit = false;
                          /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  NewOrder()));*/
                        },
                        child: flutter.Card(
                          margin: EdgeInsets.all(1.0),
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              // border: Border.all(
                              //   color: Colors.white
                              // ),
                              // boxShadow: [
                              //   BoxShadow(blurRadius:0.5,),
                              // ]
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.mail_outlined,
                                        color: Colors.red, size: 50),
                                  ),
                                  Text(
                                    GridLabel[3],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          //Config.dealerOrderEdit = false;
                          /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  NewOrder()));*/
                        },
                        child: flutter.Card(
                          margin: EdgeInsets.all(1.0),
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              // border: Border.all(
                              //   color: Colors.white
                              // ),
                              // boxShadow: [
                              //   BoxShadow(blurRadius:0.5,),
                              // ]
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.bus_alert_outlined,
                                        color: Colors.red, size: 50),
                                  ),
                                  Text(
                                    GridLabel[4],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          feedback();
                          //Config.dealerOrderEdit = false;
                          /* Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  NewOrder()));*/
                        },
                        child: flutter.Card(
                          margin: EdgeInsets.all(1.0),
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.message_outlined,
                                        color: Colors.red, size: 50),
                                  ),
                                  Text(
                                    GridLabel[5],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          //Config.dealerOrderEdit = false;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Vacation()));
                        },
                        child: flutter.Card(
                          margin: EdgeInsets.all(1.0),
                          elevation: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                              // border: Border.all(
                              //   color: Colors.white
                              // ),
                              // boxShadow: [
                              //   BoxShadow(blurRadius:0.5,),
                              // ]
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(Icons.flight_takeoff,
                                        color: Colors.red, size: 50),
                                  ),
                                  Text(
                                    GridLabel[6],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])
              ],
            ),
          )),
    );
  }

  void paymentDialog() {
    final TextEditingController paycontroller = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            child: Container(
              height: 300,
              width: 450,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'PAYMENT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(itemBuilder: (ctx, index) {
                      return ListTile(
                        title: Text(
                          'Pending Payment',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('17 Jan 2024'),
                        leading: Icon(
                          Icons.error_outline_outlined,
                          color: Colors.red[900],
                        ),
                        trailing: Text(
                          '12000',
                          style: TextStyle(
                              color: Colors.red[900],
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                          controller: paycontroller,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.grey)),
                            hintText: 'Amount',
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Palette.crm),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            right: 5, left: 5, top: 1, bottom: 1)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 13,
                        ))),
                    onPressed: () {
                      if (paycontroller.text.isNotEmpty) {
                        Navigator.pop(context);
                        makePayment(paycontroller.text);
                      }
                    },
                    child: Text('Pay',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void makePayment(String amount) async {
    try {
      paymentIntent = await createpaymentIntent(amount);

      if (paymentIntent != null) {
        print(paymentIntent.toString());
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntent!['client_secret'],
            style: ThemeMode.light,
            merchantDisplayName: 'Shibili',
            customerId: paymentIntent!['customer'],
            customerEphemeralKeySecret: paymentIntent!['ephemeralKey'],
            allowsDelayedPaymentMethods: true,
          ),
        );
        displayPaymentsheet();
      }
    } catch (e) {
      print("Exepction======>" + e.toString());
    }
  }

  createpaymentIntent(String amount) async {
    // step 1:- payment Intent
    try {
      Map<String, dynamic> body = {
        "amount": "${amount}00", //100 rs
        "currency": "inr",
        'payment_method_types[]': 'card',
        'payment_method': 'pm_card_visa',
      };
      var response = await http.post(
        Uri.parse("https://api.stripe.com/v1/payment_intents"),
        headers: {
          'Authorization':
              'Bearer sk_test_51Op6GsSCjzujotMZPbgYxJKUJbXOCcTF5v4ILjK6FlZ2iZ5IZ7WSWBTKur1BY6dedCfii2QrmNQK6B9OppPR1n3k00XjAisxgY',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      return jsonDecode(response.body);
    } catch (e) {
      print("Exepction======>" + e.toString());
    }
  }

  void displayPaymentsheet() async {
    try {
      print("Before presenting payment sheet");
      await Stripe.instance
          .presentPaymentSheet()
          .then((e) {})
          .onError((error, stackTrace) {
        print(error.toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())));
      });
    } catch (e) {
      print("ERROR" + e.toString());
    }
  }

  void feedback() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            title: Center(
                child: Text(
              ' Feedback',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            )),
            content: Container(
              height: 150,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your feedback here',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Palette.crm),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            right: 5, left: 5, top: 1, bottom: 1)),
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
            ],
          );
        });
      },
    );
  }

  void greeting() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            title: Center(
                child: Text(
              ' Greetings',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            )),
            content: Container(
              height: 150,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type your Greeting here',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8.0),
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
