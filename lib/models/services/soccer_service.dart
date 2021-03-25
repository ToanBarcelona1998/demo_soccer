import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_app/models/apis/base_api.dart';
import 'package:soccer_app/models/apis/scorer_api.dart';
import 'package:soccer_app/models/enitys/model_soccer.dart';
import 'package:soccer_app/public/shared/result_fail.dart';
import 'package:soccer_app/public/shared/result_fail_code_400.dart';
import 'package:soccer_app/public/shared/result_fail_code_403.dart';
import 'package:soccer_app/public/shared/result_fail_code_404.dart';
import 'package:soccer_app/public/shared/result_fail_code_429.dart';

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
        throw ResultFailCode400();
      }else if(stCode==403){
        throw ResultFailCode403();
      }else if(stCode==404){
        throw ResultFailCode404();
      }else if(stCode==429){
        throw ResultFailCode429();
      }
    }catch(e){
      throw ResultFail();
    }
  }
}