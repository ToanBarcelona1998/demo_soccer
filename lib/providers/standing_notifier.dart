import 'package:flutter/cupertino.dart';
import 'package:soccer_app/models/enitys/model_standing.dart';
import 'package:soccer_app/models/services/standing_service.dart';
import 'package:soccer_app/public/shared/result.dart';
import 'package:soccer_app/public/shared/result_fail.dart';
import 'package:soccer_app/public/shared/result_fail_code_400.dart';
import 'package:soccer_app/public/shared/result_fail_code_403.dart';
import 'package:soccer_app/public/shared/result_fail_code_404.dart';
import 'package:soccer_app/public/shared/result_fail_code_429.dart';
import 'package:soccer_app/public/shared/result_succes.dart';

class StandingNotifier extends ChangeNotifier{
  List<StandingModel> list1=[];
  Result result;

  fetchDataStanding(String code) async {
    try{
      StandingService service=StandingService();
      list1=await service.getStanding(code);
      result=ResultSucces<List<StandingModel>>()..data=list1;
    }on ResultFailCode400 catch(message){
      result=ResultFailCode400();
    }on ResultFailCode403 catch(message){
      result=ResultFailCode403();
    }on ResultFailCode404 catch(message){
      result=ResultFailCode404();
    }on ResultFailCode429 catch(e){
      result=ResultFailCode429();
    }
    on ResultFail catch(message){
      result=ResultFail();
    }
    notifyListeners();
  }
}