import 'package:soccer_app/public/shared/result.dart';

class ResultFail extends Result{
  @override
  message() {
    return "Result Fail because die connect to server";
  }

}