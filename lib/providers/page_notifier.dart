import 'package:flutter_riverpod/flutter_riverpod.dart';
class PageNotifier extends StateNotifier<int>{
  PageNotifier() : super(0);


  changePage(int index){
    state=index;
  }
  @override
  set state(int value) {
    // TODO: implement state
    super.state = value;
  }
}