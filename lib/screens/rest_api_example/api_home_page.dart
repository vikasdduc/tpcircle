import 'package:flutter/material.dart';
import 'package:tyreplex/screens/rest_api_example/apiServices.dart';

import 'json_model.dart';

class HomeForApi extends StatefulWidget{
  const HomeForApi( {Key? key, required this.payload,}) : super(key: key);

  final String payload;
  @override
  _HomeForApiState createState() => _HomeForApiState();

}

class _HomeForApiState extends State<HomeForApi>{
  String? _payload;
  late List<userModel>? _userModel = [];
  @override
  void initState(){
    super.initState();
    _payload = widget.payload;
    _getData();
  }

  void _getData() async{
    _userModel = (await ApiService().getUsers());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState((){}));
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('rest api'),
      ),
      body: _userModel == null || _userModel!.isEmpty
      ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _userModel!.length,
          itemBuilder: (context,index){
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('payload ${_payload ?? ''}'),
                    Text(_userModel![index].id.toString()),
                    Text(_userModel![index].username),
                  ],
                ),
                const SizedBox( height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_userModel![index].email),
                    Text(_userModel![index].website),
                  ],
                )
              ],
            ),
          );

          })
      ,
    );
  }
}