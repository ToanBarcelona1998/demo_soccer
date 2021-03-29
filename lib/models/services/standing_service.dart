import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_app/models/apis/base_api.dart';
import 'package:soccer_app/models/apis/standing_api.dart';
import 'package:soccer_app/models/enitys/model_standing.dart';
import 'package:soccer_app/public/shared/result_fail.dart';
import 'package:soccer_app/public/shared/result_fail_code_400.dart';
import 'package:soccer_app/public/shared/result_fail_code_403.dart';
import 'package:soccer_app/public/shared/result_fail_code_404.dart';
import 'package:soccer_app/public/shared/result_fail_code_429.dart';

class StandingService{
  BaseApi _baseApi;

  Future<dynamic> getStanding(String code)async{
    List<StandingModel> list=[];
    _baseApi=StandingApi(code: code);
    try{
      http.Response response=await _baseApi.getResponse();
      var stCode=response.statusCode;
      if(stCode==200){
          Map map=jsonDecode(response.body);
          List<dynamic> listMap=map["standings"][0]["table"];
          listMap.forEach((element) {
            StandingModel model=StandingModel.fromJson(element);
            list.add(model);
          });
          return list;
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