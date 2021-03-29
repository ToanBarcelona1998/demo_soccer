// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_team_standing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamStandingModel _$TeamStandingModelFromJson(Map<String, dynamic> json) {
  return TeamStandingModel()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..crestUrl = json['crestUrl'] as String;
}

Map<String, dynamic> _$TeamStandingModelToJson(TeamStandingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'crestUrl': instance.crestUrl,
    };
