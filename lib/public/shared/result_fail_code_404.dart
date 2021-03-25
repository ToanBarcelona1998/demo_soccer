import 'package:soccer_app/public/shared/result.dart';

class ResultFailCode404 extends Result{
  @override
  message() {
    return "Result fail code 404 because you tried to access a resource that doesn't exist";
  }

}