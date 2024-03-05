// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Element _$ElementFromJson(Map<String, dynamic> json) => Element(
      name: json['name'] as String,
      atomicNumber: json['atomicNumber'] as int,
      symbol: json['symbol'] as String? ?? '',
      atomicMass: json['atomicMass'] as String? ?? '',
      electronicConfiguration: json['electronicConfiguration'] as String? ?? '',
      electroNegativity: json['electroNegativity'] as String? ?? '',
      atomicRadius: json['atomicRadius'] as int? ?? 0,
      ionRadius: json['ionRadius'] as String? ?? '',
      vanDerWaalsRadius: json['vanDerWaalsRadius'] as int? ?? 0,
      ionizationEnergy: json['ionizationEnergy'] as int? ?? 0,
      electronAffinity: json['electronAffinity'] as int? ?? 0,
      oxidationStates: json['oxidationStates'] as String? ?? '',
      standardState: json['standardState'] as String? ?? '',
      bondingType: json['bondingType'] as String? ?? '',
      meltingPoint: json['meltingPoint'] ?? '',
      boilingPoint: json['boilingPoint'] ?? 0,
      density: (json['density'] as num?)?.toDouble() ?? 0.0,
      groupBlock: json['groupBlock'] as String? ?? '',
      yearDiscovered: json['yearDiscovered'] as int? ?? 0,
      block: json['block'] as String? ?? '',
      cpkHexColor: json['cpkHexColor'] as String? ?? '',
      period: json['period'] as int? ?? 0,
      group: json['group'] as int? ?? 0,
    );

Map<String, dynamic> _$ElementToJson(Element instance) => <String, dynamic>{
      'atomicNumber': instance.atomicNumber,
      'name': instance.name,
      'symbol': instance.symbol,
      'atomicMass': instance.atomicMass,
      'electronicConfiguration': instance.electronicConfiguration,
      'electroNegativity': instance.electroNegativity,
      'atomicRadius': instance.atomicRadius,
      'ionRadius': instance.ionRadius,
      'vanDerWaalsRadius': instance.vanDerWaalsRadius,
      'ionizationEnergy': instance.ionizationEnergy,
      'electronAffinity': instance.electronAffinity,
      'oxidationStates': instance.oxidationStates,
      'standardState': instance.standardState,
      'bondingType': instance.bondingType,
      'meltingPoint': instance.meltingPoint,
      'boilingPoint': instance.boilingPoint,
      'density': instance.density,
      'groupBlock': instance.groupBlock,
      'yearDiscovered': instance.yearDiscovered,
      'block': instance.block,
      'cpkHexColor': instance.cpkHexColor,
      'period': instance.period,
      'group': instance.group,
    };
