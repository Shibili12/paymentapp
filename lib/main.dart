import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentapp/HomePage.dart';
import 'package:paymentapp/theme%20components/Palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51Op6GsSCjzujotMZt18DWUnXysZVNLnhp6EkQbPjVISxAkbDb7AwQOELiCSbbPXwmSKfGVrOK9B2KvCj6GkACF0c00xj39y7ct";
  Stripe.merchantIdentifier = 'shibili';
  await Stripe.instance.applySettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
              elevation: 1,
              backgroundColor: Palette.ToDoRed,
              iconTheme: IconThemeData(color: Colors.white))),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
