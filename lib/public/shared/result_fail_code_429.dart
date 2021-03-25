import 'package:soccer_app/public/shared/result.dart';

class ResultFailCode429 extends Result{
  @override
  message() {
      return "Result fail code 429 because you exceeded your API request quota. ";
  }

}