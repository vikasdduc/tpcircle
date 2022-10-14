//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
// import 'package:flutter/services.dart';

import '../Drawer/drawer_page.dart';
import '../filterPages/filter_screen.dart';
import '../myOrderPages/my_order.dart';

class UrlLauncher extends StatefulWidget {
  const UrlLauncher({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UrlLauncherState();
}

class UrlLauncherState extends State<UrlLauncher> {

  // static const platform = MethodChannel('app.channel.shared.data');
  String dataShared = 'No data';

  var myUrl;


  var staticLink1 = Uri.parse('https://www.tyreplex.com/tp-admin/?mod=dashboard');
  var staticLink2 = Uri.parse('https://www.tyreplex.com/tp-admin/?mod=invoice');
  var staticLink3 = Uri.parse('https://www.tyreplex.com/tp-admin/?mod=notification');
  var staticLink4 = Uri.parse('https://www.tyreplex.com/tp-admin/?mod=virtual_number');

  var appPage1 = const DrawerPage();
  var appPage3 = const FilterPage();
  var appPage4 = const MyOrdersPage();


  var list = [];

  // var list = pageUrlMap.values.toList();

  @override
  void initState() {
    super.initState();
    // getSharedText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Url launcher"),
),
      body: Column(
        children: [
          // Text(dataShared),
          //  ListTile(
          //    title: const Text("Launch Web Page"),
          //    onTap: () async {
          //      // Switch(value: null, onChanged: (bool value) {  }, );
          //      myUrl = pageUrlMap;
          //  var url = myUrl;
          //  if (await canLaunchUrl(url as Uri)) {
          //  await launchUrl(url as Uri,);
          //  } else {
          //  throw 'Could not launch $url';}},),
          ElevatedButton(

            onPressed: (){
              // if(appPage1 == staticLink1){
              //   print("app page1 was tapped");
              // } else if( appPage3 == staticLink3){
              //   print(" page3 was tapped");
              // } else if (appPage4 == staticLink4){
              //   print("page4 was tapped");
              // } else {
              //   print( "this page 5 was print");
              // }

              // if (pageUrlMap.keys.first){
              //   return pageUrlMap.values.first;
              // } else
              //   if (pageUrlMap.keys.second){
              //   return pageUrlMap.values.second;
              // } else
              //   if (pageUrlMap.keys.third){
              //   return pageUrlMap.values.third;
              // } else {
              //   Uri.parse('https.tyreplex.com');
              // }

            },
            child: const Text("Page navigate")
         ),
          Link(
              uri: Uri.parse('https://www.tyreplex.com/tp-admin/?mod=dashboard'),
              builder: (context, followlink)=> ElevatedButton(
                  onPressed: followlink, child: const Text("new app button")))


        ],
      ),
    );
  }


  // Future<void> getSharedText() async {
  //   var sharedData = await platform.invokeMethod('getSharedText');
  //   if (sharedData != null) {
  //     setState(() {
  //       dataShared = sharedData;
  //     });
  //   }
  // }

  // final pageUrlMap = Uri.parse('https://www.tyreplex.com/tp-admin/?mod=dashboard#gsc.tab=0');




  Map<Widget, Uri> pageUrlMap = {

    const MyOrdersPage(): Uri.parse('https://www.tyreplex.com/tp-admin/?mod=dashboard'),

  };

}