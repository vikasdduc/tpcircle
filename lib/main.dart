import 'package:flutter/material.dart';
import 'package:tyreplex/screens/login.dart';
import 'package:tyreplex/screens/otp_page.dart';

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
        initialRoute:   '/',
        routes: {
          '/':  (context) => const LoginPage(),
          'otpPageview':  (context) => const OtpPage(),
        }, //creating routes
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

      );
  }
}
