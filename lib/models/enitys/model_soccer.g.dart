// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_soccer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoccerModel _$SoccerModelFromJson(Map<String, dynamic> json) {
  return SoccerModel()
    ..player = json['player'] == null
        ? null
        : PlayerModel.fromJson(json['player'] as Map<String, dynamic>)
    ..numberOfGoals = json['numberOfGoals'] as int
    ..team = json['team'] == null
        ? null
        : TeamSoccerModel.fromJson(json['team'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SoccerModelToJson(SoccerModel instance) =>
    <String, dynamic>{
      'player': instance.player,
      'numberOfGoals': instance.numberOfGoals,
      'team': instance.team,
    };
