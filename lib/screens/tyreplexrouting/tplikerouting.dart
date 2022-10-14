// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
//
// void main() {
//   runApp(StartupApplication());
// }
//
// enum Page { screenDashboard, screenProfile, screenSearch }
//
// extension on Page {
//   String get route => describeEnum(this);
// }
//
// class StartupApplication extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BackStack Support App',
//       home: MainBodyApp(),
//     );
//   }
// }
//
// class MainBodyApp extends HookWidget {
//   final Map<Page, Widget> _fragments = {
//     Page.screenDashboard: DashboardPage(),
//     Page.screenProfile: UserProfilePage(),
//     Page.screenSearch: SearchPage(),
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     final navigatorKey = GlobalObjectKey<NavigatorState>(context);
//
//     return WillPopScope(
//       onWillPop: () async {
//         if (navigatorKey.currentState.canPop()) {
//           navigatorKey.currentState.pop();
//           return false;
//         }
//
//         return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('BackStack Screen'),
//         ),
//         body: Container(
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Navigator(
//                   key: navigatorKey,
//                   initialRoute: Page.screenDashboard.route,
//                   onGenerateRoute: (settings) {
//                     final pageName = settings.name;
//
//                     final page = _fragments.keys.firstWhere(
//                             (element) => describeEnum(element) == pageName);
//
//                     return MaterialPageRoute(settings: settings,
//                         builder: (context) => _fragments[page]);
//                   },
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 50.0,
//                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                 color: Colors.indigo[400],
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     RaisedButton(
//                       onPressed: () => navigatorKey.currentState
//                           .pushNamed(Page.screenDashboard.route),
//                       child: Text('Dashboard'),
//                     ),
//                     RaisedButton(
//                       onPressed: () => navigatorKey.currentState
//                           .pushNamed(Page.screenProfile.route),
//                       child: Text('Profile'),
//                     ),
//                     RaisedButton(
//                       onPressed: () => navigatorKey.currentState
//                           .pushNamed(Page.screenSearch.route),
//                       child: Text('Search'),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class UserProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: Text(' screenProfile ...'),
//     );
//   }
// }
//
// class DashboardPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: Text(' screenDashboard ...'),
//     );
//   }
// }
//
// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: Text(' screenSearch ...'),
//     );
//   }
// }