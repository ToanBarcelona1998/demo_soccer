import 'package:flutter/cupertino.dart';
import 'package:soccer_app/models/enitys/model_standing.dart';
import 'package:soccer_app/models/services/standing_service.dart';

class StandingNotifier extends ChangeNotifier{
  List<StandingModel> list=[];

  fetchDataStanding(String code) async {
    StandingService service=StandingService();
    list=await service.getStanding(code);
    notifyListeners();
  }
}