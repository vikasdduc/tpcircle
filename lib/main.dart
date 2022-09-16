import 'package:flutter/material.dart';
import 'package:tyreplex/screens/filterPages/filter_screen.dart';
//import 'package:tyreplex/screens/login.dart';

//import 'package:tyreplex/screens/myOrderPages/my_order.dart';
//import 'package:tyreplex/screens/otp_page.dart';

void main() {
  runApp( MyApp(title: 'Demo app ',));
}



class MyApp extends StatefulWidget {
  MyApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:   '/',
        routes: {
          '/':  (context) => const FilterPage(),
          //MyOrdersPage(),
          //FilterPage(),
          // LoginPage(),
          //'otpPageview':  (context) => const OtpPage(),
          //'myOrderPage' : (context) => const MyOrdersPage(),
        }, //creating routes
        title: 'Log in page',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),

      );
  }
}
