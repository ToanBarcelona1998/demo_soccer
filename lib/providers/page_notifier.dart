import 'package:flutter/cupertino.dart';
class PageNotifier extends ChangeNotifier{
  int ?_selectPage;
  PageNotifier([this._selectPage=0]);

  get selectPage=>this._selectPage;

  changePage(int index){
    _selectPage=index;
    notifyListeners();
  }
}