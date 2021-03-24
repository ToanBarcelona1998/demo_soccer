// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_standing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StandingModel _$StandingModelFromJson(Map<String, dynamic> json) {
  return StandingModel()
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..crestUrl = json['crestUrl'] as String?
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
      'id': instance.id,
      'name': instance.name,
      'crestUrl': instance.crestUrl,
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
