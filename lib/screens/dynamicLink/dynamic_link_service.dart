// import 'dart:async';
// //import 'package:deeplink/route_services.dart';
// //import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:tyreplex/screens/dynamicLink/path_constant.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// // Future<void> main() async {
// //   await init();
// //   runApp(const DynamicPage());
// // }
// // Future init() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// // }
//
//
//
// class DynamicLinkScreen extends StatefulWidget {
//   const DynamicLinkScreen({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => _DynamicLinkScreenState();
// }
//
// class _DynamicLinkScreenState extends State<DynamicLinkScreen> {
//   String? _linkMessage;
//   bool _isCreatingLink = false;
//
//   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     initDynamicLinks();
//   }
//
//   Future<void> initDynamicLinks() async {
//     dynamicLinks.onLink.listen((dynamicLinkData) {
//       final Uri uri = dynamicLinkData.link;
//       print("dynamicLinkData.link-start  ");
//
//       print( dynamicLinkData.link);
//       print(" dynamicLinkData.link-end");
//
//       final queryParams = uri.queryParameters;
//       if (queryParams.isNotEmpty) {
//         String? productId = queryParams["id"];
//         Navigator.pushNamed(context, dynamicLinkData.link.path,
//             arguments: {"productId": int.parse(productId!)});
//       } else {
//         Navigator.pushNamed(
//           context,
//           dynamicLinkData.link.path,
//         );
//       }
//     }).onError((error) {
//       print('onLink error');
//       print(error.message);
//     });
//   }
//
//   Future<void> _createDynamicLink(String link) async {
//     setState(() {
//       _isCreatingLink = true;
//     });
//
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: kUriPrefix,
//       link: Uri.parse(kUriPrefix + link),
//       // androidParameters:  AndroidParameters(
//       //   fallbackUrl: Uri(path:"https://www.tyreplex.com"),
//       //   packageName: 'com.example.tyreplex',
//       //   minimumVersion: 21,
//       // ),
//     );
//
//     Uri url;
//     url = await dynamicLinks.buildLink(parameters);
//     // if (short) {
//     //   final ShortDynamicLink shortLink =
//     //   await dynamicLinks.buildShortLink(parameters);
//     //   url = shortLink.shortUrl;
//     // } else {
//     //   url = await dynamicLinks.buildLink(parameters);
//     // }
//
//     setState(() {
//       _linkMessage = url.toString();
//       _isCreatingLink = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text('Dynamic Links '),
//       ),
//       body: Builder(
//         builder: (BuildContext context) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 ButtonBar(
//                   alignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     ElevatedButton(
//                       onPressed: !_isCreatingLink
//                           ? () => _createDynamicLink( kProductpageLink)
//                           : null,
//                       child: const Text('Get Link'),
//                     ),
//                     // ElevatedButton(
//                     //   onPressed: !_isCreatingLink
//                     //       ? () => _createDynamicLink(true, kHomepageLink)
//                     //       : null,
//                     //   child: const Text('Get Short Link '),
//                     // ),
//                   ],
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     if (_linkMessage != null) {
//                       await launch(_linkMessage!);
//                     }
//                   },
//                   onLongPress: () {
//                     Clipboard.setData(ClipboardData(text: _linkMessage));
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Copied Link!')),
//                     );
//                   },
//                   child: Text(
//                     _linkMessage ?? '',
//                     style: const TextStyle(color: Colors.blue),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }