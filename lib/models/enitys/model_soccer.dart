import 'package:json_annotation/json_annotation.dart';
import 'package:soccer_app/models/enitys/model_player.dart';
import 'package:soccer_app/models/enitys/model_team.dart';
part 'model_soccer.g.dart';

@JsonSerializable()
class SoccerModel{
  PlayerModel ?playerModel;
  int? numberOfGoals;
  TeamModel ?teamModel;

  SoccerModel();
  factory SoccerModel.fromJson(Map<String,dynamic> map)=>_$SoccerModelFromJson(map);
  toJson()=>_$SoccerModelToJson(this);
}