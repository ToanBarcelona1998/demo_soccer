// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_team_soccer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamSoccerModel _$TeamSoccerModelFromJson(Map<String, dynamic> json) {
  return TeamSoccerModel()
    ..id = json['id'] as int?
    ..name = json['name'] as String?;
}

Map<String, dynamic> _$TeamSoccerModelToJson(TeamSoccerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
