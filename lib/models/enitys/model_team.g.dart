// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamModel _$TeamModelFromJson(Map<String, dynamic> json) {
  return TeamModel()
    ..id = json['id'] as int?
    ..name = json['name'] as String?;
}

Map<String, dynamic> _$TeamModelToJson(TeamModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
