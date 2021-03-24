import 'package:soccer_app/models/apis/base_api.dart';

class StandingApi extends BaseApi{
  String ?code;
  StandingApi({this.code});
  @override
  action() {
    return "competitions";
  }

  @override
  param() {
    return "standings";
  }

  @override
  tournameny() {
    return code;
  }

}