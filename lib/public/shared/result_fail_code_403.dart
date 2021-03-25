import 'package:soccer_app/public/shared/result.dart';

class ResultFailCode403 extends Result{
  @override
  message() {
    return "Result fail code 403 because you tried to access a resource that exists, but is not available to you. ";
  }

}