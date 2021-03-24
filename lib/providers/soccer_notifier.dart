import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soccer_app/models/enitys/model_soccer.dart';
import 'package:soccer_app/models/services/soccer_service.dart';

class SoccerNotifier extends StateNotifier<List<SoccerModel>>{
  SoccerNotifier() : super([]);

  getSoccerNotifier(code)async{
    SoccerService service=SoccerService();
    state=await service.getSoccer(code);
  }

  @override
  set state(List<SoccerModel> value) {
    // TODO: implement state
    super.state = value;
  }
}