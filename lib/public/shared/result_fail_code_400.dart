import 'package:soccer_app/public/shared/result.dart';

class ResultFailCode400 extends Result{
  @override
  message() {
    return "Result fail code 400 because your request was malformed.";
  }

}