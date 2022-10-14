import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';



class YoutubeUrlPage extends StatefulWidget {
  YoutubeUrlPage({Key? key, }) : super(key: key);


  @override
  _YoutubeUrlPageState createState() => _YoutubeUrlPageState();
}

class _YoutubeUrlPageState extends State<YoutubeUrlPage> {
  final url = 'https://www.tyreplex.com/mrf-tyres';
  String? error;

  @override
  void initState() {
    FlutterError.onError = (_error) => setState(() {
      error = _error.exceptionAsString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text("tyreplex launch"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Link(
                target: LinkTarget.blank,
                uri: Uri.parse(url),
                builder: (context, followLink) => OutlinedButton(
                  onPressed: followLink,
                  child: Text('Not working '),
                ),
              ),
              OutlinedButton(
                onPressed: () async {
                  launch(url);
                  setState(() {
                    error = null;
                  });
                },
                child: Text('Working - Open Tyreplex Channel'),
              ),
              Text(error ?? '')
            ],
          ),
        ),
      ),
    );
  }
}