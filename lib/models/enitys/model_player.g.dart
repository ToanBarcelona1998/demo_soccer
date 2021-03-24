// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerModel _$PlayerModelFromJson(Map<String, dynamic> json) {
  return PlayerModel()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..dateOfBirth = json['dateOfBirth'] as String?
    ..nationality = json['nationality'] as String?
    ..position = json['position'] as String?;
}

Map<String, dynamic> _$PlayerModelToJson(PlayerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateOfBirth': instance.dateOfBirth,
      'nationality': instance.nationality,
      'position': instance.position,
    };
