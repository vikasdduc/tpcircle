import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tyreplex/screens/login.dart';
//import 'package:tyreplex/screens/filterPages/filter_screen.dart';
//import 'package:tyreplex/screens/login.dart';
//import 'package:tyreplex/screens/filterPages/filter_screen.dart';

//import 'package:tyreplex/screens/myOrderPages/my_order.dart';
//import 'package:tyreplex/screens/otp_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp( const MyApp(title: 'Tp Demo',));
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.title}) : super(key: key);
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
        home:const LoginScreen() ,
        // initialRoute:   '/',
        // routes: {
        //   '/':  (context) => const LoginPage(),
        //   '/myFilterPage' : (context) => const FilterPage(),
        //
        //   //FilterPage(),
        //   'otpPageview':  (context) => const OtpPage(),
        //   'myOrderPage' : (context) => const MyOrdersPage(),
        // }, //creating routes
        title: 'Log in page',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),

      );
  }
}
