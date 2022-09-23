import 'dart:developer';

//import 'package:untitled1/rest_api_example/json_model.dart';
import 'package:http/http.dart' as http;

import 'json_model.dart';
import 'public_api_constant.dart';


class ApiService{
  Future<List<userModel>?> getUsers()async{
    try{

      var url = Uri.parse(ApiConstants.baseUrl +  ApiConstants.userEndsPoint);
      var response = await http.get(url);
      if(response.statusCode == 200){
        List<userModel> _model = welcomeFromJson(response.body);
        return _model;

      }
    } catch(e){
      log(e.toString());
    }

  }
}