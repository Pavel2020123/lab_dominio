// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reporte.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reporte _$ReporteFromJson(Map<String, dynamic> json) => _Reporte(
  id: json['id'] as String,
  titulo: json['titulo'] as String,
  descripcion: json['descripcion'] as String,
  ubicacion: Ubicacion.fromJson(json['ubicacion'] as Map<String, dynamic>),
  creadoEn: DateTime.parse(json['creadoEn'] as String),
  fotos:
      (json['fotos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  resueltoPor: json['resueltoPor'] as String?,
);

Map<String, dynamic> _$ReporteToJson(_Reporte instance) => <String, dynamic>{
  'id': instance.id,
  'titulo': instance.titulo,
  'descripcion': instance.descripcion,
  'ubicacion': instance.ubicacion,
  'creadoEn': instance.creadoEn.toIso8601String(),
  'fotos': instance.fotos,
  'resueltoPor': instance.resueltoPor,
};
