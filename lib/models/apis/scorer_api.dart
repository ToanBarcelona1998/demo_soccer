import 'package:soccer_app/models/apis/base_api.dart';

class SoccerApi extends BaseApi{
  String ?code;
  SoccerApi({this.code});
  @override
  action() {
    return "competitions";
  }

  @override
  param() {
    return "scorers";
  }

  @override
  tournameny() {
    return code;
  }
}