// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_standing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandingModel _$StandingModelFromJson(Map<String, dynamic> json) {
  return StandingModel()
    ..position = json['position'] as int?
    ..team = json['team'] == null
        ? null
        : TeamStandingModel.fromJson(json['team'] as Map<String, dynamic>)
    ..playedGames = json['playedGames'] as int?
    ..form = json['form'] as String?
    ..won = json['won'] as int?
    ..draw = json['draw'] as int?
    ..lost = json['lost'] as int?
    ..points = json['points'] as int?
    ..goalsFor = json['goalsFor'] as int?
    ..goalsAgainst = json['goalsAgainst'] as int?
    ..goalDifference = json['goalDifference'] as int?;
}

Map<String, dynamic> _$StandingModelToJson(StandingModel instance) =>
    <String, dynamic>{
      'position': instance.position,
      'team': instance.team,
      'playedGames': instance.playedGames,
      'form': instance.form,
      'won': instance.won,
      'draw': instance.draw,
      'lost': instance.lost,
      'points': instance.points,
      'goalsFor': instance.goalsFor,
      'goalsAgainst': instance.goalsAgainst,
      'goalDifference': instance.goalDifference,
    };
