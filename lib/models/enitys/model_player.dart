import 'package:json_annotation/json_annotation.dart';
part 'model_player.g.dart';
@JsonSerializable()
class PlayerModel{
  int id;
  String name;
  String dateOfBirth;
  String nationality;
  String position;
  PlayerModel();
  factory PlayerModel.fromJson(Map<String,dynamic> map)=>_$PlayerModelFromJson(map);
  toJson()=>_$PlayerModelToJson(this);
}