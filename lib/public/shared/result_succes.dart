import 'package:soccer_app/public/shared/result.dart';

class ResultSucces<T> extends Result{
  T data;
  @override
  message() {
    return "Result Succes";
  }

}