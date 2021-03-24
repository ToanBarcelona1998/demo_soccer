import 'package:json_annotation/json_annotation.dart';
part 'model_team.g.dart';
@JsonSerializable()
class TeamModel{
  int? id;
  String? name;
  TeamModel();
  factory TeamModel.fromJson(Map<String,dynamic> map)=>_$TeamModelFromJson(map);
  toJson()=>_$TeamModelToJson(this);
}