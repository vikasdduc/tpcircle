import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tyreplex/screens/dynamicLink/Link_URl_Launcher.dart';
//import 'package:tyreplex/screens/dynamicLink/dynamic_link_service.dart';
import 'package:tyreplex/screens/dynamicLink/url_launcher_tyreplex.dart';
import 'package:tyreplex/screens/myOrderPages/my_order.dart';
import 'package:tyreplex/screens/rest_api_example/api_home_page.dart';

// import 'filterPageForLink.dart';


/// call. Be sure to annotate the handler with `@pragma('vm:entry-point')` above the function declaration.
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
  await setupFlutterNotifications();
  // showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  //print('Handling a background message ${message.messageId}');
}


final selectNotificationSubject =
BehaviorSubject<int?>();

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground firebase_notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          //
          icon: 'launch_background',
          actions: <AndroidNotificationAction>[
            AndroidNotificationAction(
              //  selectedNotificationPayload!,  navigationActionId!;
              navigationActionId!, 'Accept',
              showsUserInterface: true,
              cancelNotification: false,
              titleColor: Color.fromARGB(255, 0, 0, 255),
            ),


            AndroidNotificationAction(channel.id, 'Reject',),
            //  AndroidNotificationAction('id_3', 'Action 3'),
          ],
        ),
      ),
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
String? navigationActionId = 'id_3';
String? selectedNotificationPayload;
String initialRoute = '/';

void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }

}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  String? token = await FirebaseMessaging.instance.getToken();
  print("token_start ${token} token_end");
  if (!kIsWeb) {
    await setupFlutterNotifications();
  }

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('ic_launcher');



  final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
      Platform.isLinux
      ? null
      : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    selectedNotificationPayload =
        notificationAppLaunchDetails!.notificationResponse?.payload;
    initialRoute = HomeForApi(payload: '',) as String;
  }
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) {

      selectNotificationSubject.add(1);


    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  runApp(MessagingApp());
}

/// Entry point for the example application.
class MessagingApp extends StatelessWidget {
  const MessagingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tyreplex demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => Application(),
        '/apipage': (context) => const HomeForApi(payload: '',),
        //'/DynamicLinkScreen':(context) => const DynamicLinkScreen(),
        '/urllauncher':(context) => const UrlLauncher(),
        '/MyOrdersPage' : (context) => const MyOrdersPage(),
        '/Youtubepage' : (context) => YoutubeUrlPage(),


        //'/message': (context) => MessageView(),
      },
    );
  }
}

// Crude counter to make messages unique
int _messageCount = 0;

/// The API endpoint here accepts a raw FCM payload for demonstration purposes.
String constructFCMPayload(String? token) {
  _messageCount++;
  return jsonEncode({
    'token': token,
    'data': {
      'via': 'FlutterFire Cloud Messaging!!!',
      'count': _messageCount.toString(),
    },
    'firebase_notification': {
      'title': 'Hello FlutterFire!',
      'body': 'This firebase_notification (#$_messageCount) was created via FCM!',
    },
  });
}

/// Renders the example application.
class Application extends StatefulWidget {
  // late final LinkPage page; // have to call the page and uncommennt
  @override
  State<StatefulWidget> createState() => _Application();
}

class _Application extends State<Application> {
  String? _token;

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   Navigator.pushNamed(
    //     context,
    //     '/message',
    //     arguments: MessageArguments(message, true),
    //   );
    // });

    _configureSelectNotificationSubject();

  }
  void _configureSelectNotificationSubject() {
    print("nsdjfndjfn djf scsdsdfsfvvvvvvvvvvvvvvvvvvvvvvvvvsfj");

    selectNotificationSubject.stream.listen((int? i)async{
      print("nsdjfndjfn djf j");
      await  Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) => HomeForApi(payload: 'payload',),
      ));
    });
    //
    // try{ selectNotificationSubject.stream.listen((String? payload) async {
    //
    //
    //   print("nsdjfndjfn djf j");
    //   // await  Navigator.of(context).push(MaterialPageRoute<void>(
    //   //    builder: (BuildContext context) => HomeForApi(payload: 'payload',),
    //   //  ));
    //  });
    // }catch(err){print("i am giving error because $err");}
  }



  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }
  Future<void> sendPushMessage() async {
    if (_token == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        // body: constructFCMPayload(_token),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        {
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test".',
          );
          await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.',
          );
        }
        break;
      case 'unsubscribe':
        {
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".',
          );
          await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.',
          );
        }
        break;
      case 'get_apns_token':
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            print('FlutterFire Messaging Example: Getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            print('FlutterFire Messaging Example: Got APNs token: $token');
          } else {
            print(
              'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.',
            );
          }
        }
        break;
      default:
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Messaging'),
        actions: <Widget>[
          IconButton(
              iconSize: 30,
              color: Colors.red,
              onPressed: (){
                Navigator.pushNamed(context, '/urllauncher');
              },
              icon: const Icon(Icons.navigate_next,)
          ),
          IconButton(
              iconSize: 30,
              color: Colors.red,
              onPressed: (){
                Navigator.pushNamed(context, '/Youtubepage');
              },
              icon: const Icon(Icons.youtube_searched_for,)
          ),
          IconButton(
              iconSize: 30,
              color: Colors.red,
              onPressed: (){
                Navigator.pushNamed(context, '/DynamicLinkScreen');
              },
              icon: const Icon(Icons.link,)
          ),
          // PopupMenuButton(
          //   onSelected: onActionSelected,
          //   itemBuilder: (BuildContext context) {
          //     return [
          //       const PopupMenuItem(
          //         value: 'subscribe',
          //         child: Text('Subscribe to topic'),
          //       ),
          //       const PopupMenuItem(
          //         value: 'unsubscribe',
          //         child: Text('Unsubscribe to topic'),
          //       ),
          //       const PopupMenuItem(
          //         value: 'get_apns_token',
          //         child: Text('Get APNs token (Apple only)'),
          //       ),
          //     ];
          //   },
          // ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: sendPushMessage,
          backgroundColor: Colors.white,
          child: const Icon(Icons.send),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //MetaCard('Permissions', Permissions()),
            // MetaCard(
            //   'FCM Token',
            //   TokenMonitor((token) {
            //     _token = token;
            //     return token == null
            //         ? const CircularProgressIndicator()
            //         : Text(token, style: const TextStyle(fontSize: 12));
            //   }),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     FirebaseMessaging.instance
            //         .getInitialMessage()
            //         .then((RemoteMessage? message) {
            //       if (message != null) {
            //         Navigator.pushNamed(
            //           context,
            //           '/message',
            //          // arguments: MessageArguments(message, true),
            //         );
            //       }
            //     });
            //   },
            //   child: const Text('getInitialMessage()'),
            // ),
            //MetaCard('Message Stream', MessageList()
            // ),
          ],
        ),
      ),
    );
  }
}

