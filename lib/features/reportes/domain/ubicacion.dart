import 'package:freezed_annotation/freezed_annotation.dart';

part 'ubicacion.freezed.dart';
part 'ubicacion.g.dart';

@freezed
abstract class Ubicacion with _$Ubicacion {
  const factory Ubicacion({
    required double latitud,
    required double longitud,
  }) = _Ubicacion;

  factory Ubicacion.fromJson(Map<String, dynamic> json) =>
      _$UbicacionFromJson(json);
}