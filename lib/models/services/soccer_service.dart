import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_app/models/apis/base_api.dart';
import 'package:soccer_app/models/apis/scorer_api.dart';
import 'package:soccer_app/models/enitys/model_soccer.dart';

class SoccerService{
  BaseApi ?_baseApi;
  Future<dynamic> getSoccer(String code)async{
    List<SoccerModel> _listSoccer=[];
    _baseApi=SoccerApi(code: code);
    try{
      http.Response response=await _baseApi!.getResponse();
      var stCode=response.statusCode;
      if(stCode==200){
        Map map=jsonDecode(response.body);
        List<dynamic> listMap=map["scorers"];
        listMap.forEach((element) {
          SoccerModel soccerModel=SoccerModel.fromJson(element);
          _listSoccer.add(soccerModel);
        });
        return _listSoccer;
      }else if(stCode==400){
        return "Lỗi 400";
      }else if(stCode==403){
        return "Lỗi 403";
      }else{
        return "Không biết lỗi";
      }
    }catch(e){
      throw Exception(e.toString());
    }
  }
}