import 'package:json_annotation/json_annotation.dart';
part 'model_team_standing.g.dart';
@JsonSerializable()
class TeamStandingModel{
  int id;
  String name;
  String crestUrl;
  TeamStandingModel();
  factory TeamStandingModel.fromJson(Map<String,dynamic> map)=>_$TeamStandingModelFromJson(map);
  toJson()=>_$TeamStandingModelToJson(this);
}