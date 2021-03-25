import 'dart:async';

import 'package:http/http.dart' as http;
abstract class BaseApi{
  String _domain="https://api.football-data.org//v2/";
  String _auth_token="X-Auth-Token";
  String _my_token="3d0c5e5ab2db465b9b1fed640c674316";
  String _slash="/";
  action();
  tournameny();
  param();
  getResponse() async{
    String url=_domain+action()+_slash+tournameny()+_slash+param();
    http.Response response=await http.get(Uri.parse(url),headers: {_auth_token : _my_token})
    .timeout(Duration(seconds: 15),
    onTimeout: ()async{
      await http.Client()..close();
      throw TimeoutException("Time out");
    });
    return response;
  }
}
