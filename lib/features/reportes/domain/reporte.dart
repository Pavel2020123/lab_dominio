import 'package:freezed_annotation/freezed_annotation.dart';
import 'ubicacion.dart';

part 'reporte.freezed.dart';
part 'reporte.g.dart';

@freezed
abstract class Reporte with _$Reporte {
  const factory Reporte({
    required String id,
    required String titulo,
    required String descripcion,
    required Ubicacion ubicacion,
    required DateTime creadoEn,
    @Default(<String>[]) List<String> fotos,
    String? resueltoPor,
  }) = _Reporte;

  const Reporte._();

  factory Reporte.fromJson(Map<String, dynamic> json) =>
      _$ReporteFromJson(json);

  bool get estaResuelto => resueltoPor != null;

  Duration get antiguedad => DateTime.now().difference(creadoEn);
}
