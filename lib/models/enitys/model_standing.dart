import 'package:json_annotation/json_annotation.dart';
import 'package:soccer_app/models/enitys/model_team_standing.dart';
part 'model_standing.g.dart';

@JsonSerializable()
class StandingModel{
  int ?position;
  TeamStandingModel ?team;
  int ?playedGames;
  String ?form;
  int ?won;
  int ?draw;
  int ?lost;
  int ?points;
  int ?goalsFor;
  int ?goalsAgainst;
  int ?goalDifference;
  StandingModel();
  factory StandingModel.fromJson(Map<String,dynamic> map)=>_$StandingModelFromJson(map);
  toJson()=>_$StandingModelToJson(this);
}