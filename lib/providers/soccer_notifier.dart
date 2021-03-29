import 'package:flutter/cupertino.dart';
import 'package:soccer_app/models/enitys/model_soccer.dart';
import 'package:soccer_app/models/services/soccer_service.dart';
import 'package:soccer_app/public/shared/result.dart';
import 'package:soccer_app/public/shared/result_fail.dart';
import 'package:soccer_app/public/shared/result_fail_code_400.dart';
import 'package:soccer_app/public/shared/result_fail_code_403.dart';
import 'package:soccer_app/public/shared/result_fail_code_404.dart';
import 'package:soccer_app/public/shared/result_fail_code_429.dart';
import 'package:soccer_app/public/shared/result_succes.dart';

class SoccerNotifier extends ChangeNotifier {
  Result result;
  List<SoccerModel> list = [];

  getSoccerNotifier(code) async {
    try {
      SoccerService service = SoccerService();
      list = await service.getSoccer(code);
      result = ResultSucces<List<SoccerModel>>()..data = list;
    } on ResultFailCode400 catch (e) {
      result = ResultFailCode400();
    } on ResultFailCode403 catch (e) {
      result = ResultFailCode403();
    } on ResultFailCode404 catch (e) {
      result = ResultFailCode404();
    } on ResultFailCode429 catch (e) {
      result = ResultFailCode429();
    } on ResultFail catch (e) {
      result = ResultFail();
    }
    notifyListeners();
  }
}
