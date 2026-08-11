// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ubicacion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ubicacion _$UbicacionFromJson(Map<String, dynamic> json) => _Ubicacion(
  latitud: (json['latitud'] as num).toDouble(),
  longitud: (json['longitud'] as num).toDouble(),
);

Map<String, dynamic> _$UbicacionToJson(_Ubicacion instance) =>
    <String, dynamic>{
      'latitud': instance.latitud,
      'longitud': instance.longitud,
    };
