import 'package:json_annotation/json_annotation.dart';
import 'package:soccer_app/models/enitys/model_player.dart';
import 'package:soccer_app/models/enitys/model_team_soccer.dart';
part 'model_soccer.g.dart';

@JsonSerializable()
class SoccerModel{
  PlayerModel ?player;
  int? numberOfGoals;
  TeamSoccerModel ?team;

  SoccerModel();
  factory SoccerModel.fromJson(Map<String,dynamic> map)=>_$SoccerModelFromJson(map);
  toJson()=>_$SoccerModelToJson(this);
}