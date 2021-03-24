// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_soccer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoccerModel _$SoccerModelFromJson(Map<String, dynamic> json) {
  return SoccerModel()
    ..playerModel = json['playerModel'] == null
        ? null
        : PlayerModel.fromJson(json['playerModel'] as Map<String, dynamic>)
    ..numberOfGoals = json['numberOfGoals'] as int?
    ..teamModel = json['teamModel'] == null
        ? null
        : TeamModel.fromJson(json['teamModel'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SoccerModelToJson(SoccerModel instance) =>
    <String, dynamic>{
      'playerModel': instance.playerModel,
      'numberOfGoals': instance.numberOfGoals,
      'teamModel': instance.teamModel,
    };
