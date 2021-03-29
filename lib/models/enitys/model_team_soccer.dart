import 'package:json_annotation/json_annotation.dart';
part 'model_team_soccer.g.dart';
@JsonSerializable()
class TeamSoccerModel{
  int id;
  String name;
  TeamSoccerModel();
  factory TeamSoccerModel.fromJson(Map<String,dynamic> map)=>_$TeamSoccerModelFromJson(map);
  toJson()=>_$TeamSoccerModelToJson(this);
}