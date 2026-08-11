import 'package:flutter_test/flutter_test.dart';
import 'package:lab_dominio/features/reportes/domain/estado_reporte.dart';
import 'package:lab_dominio/features/reportes/domain/reporte.dart';
import 'package:lab_dominio/features/reportes/domain/ubicacion.dart';

void main() {
  group('Reglas de edición de estados', () {
    test('1. un reporte en revisión no se puede editar', () {
      const estado = EnRevision('cuadrilla-3');
      expect(estado.puedeEditar(), isFalse);
    });

    test('2. un reporte rechazado se puede corregir', () {
      const estado = Rechazado('faltan fotos');
      expect(estado.puedeEditar(), isTrue);
    });

    test('3. un borrador siempre se puede editar', () {
      const estado = Borrador();
      expect(estado.puedeEditar(), isTrue);
    });

    test('4. un reporte enviado se puede editar', () {
      final estado = Enviado(DateTime.now());
      expect(estado.puedeEditar(), isTrue);
    });

    test('5. un reporte resuelto no se puede editar', () {
      final estado = Resuelto(DateTime.now(), 'foto_url');
      expect(estado.puedeEditar(), isFalse);
    });
  });

  group('Etiquetas de estados', () {
    test('6. etiqueta de borrador es correcta', () {
      const estado = Borrador();
      expect(estado.etiqueta, 'Borrador');
    });

    test('7. etiqueta de rechazado muestra el motivo', () {
      const estado = Rechazado('sin pruebas');
      expect(estado.etiqueta, 'Rechazado: sin pruebas');
    });
  });

  group('Reglas de la entidad Reporte', () {
    final reporteBase = Reporte(
      id: '1',
      titulo: 'Hueco',
      descripcion: 'Hueco grande',
      ubicacion: const Ubicacion(latitud: 10.0, longitud: -73.0),
      creadoEn: DateTime.now(),
    );

    test('8. dos reportes con los mismos datos son iguales', () {
      final a = reporteBase;
      final b = reporteBase.copyWith();
      expect(a, equals(b));
    });

    test('9. reporte con resueltoPor no nulo está resuelto', () {
      final reporte = reporteBase.copyWith(resueltoPor: 'admin');
      expect(reporte.estaResuelto, isTrue);
    });

    test('10. reporte sin resueltoPor no está resuelto', () {
      expect(reporteBase.estaResuelto, isFalse);
    });

    test(
      '11. la antigüedad es mayor a cero instantes después de crearlo',
      () async {
        final reporte = Reporte(
          id: '2',
          titulo: 'Test',
          descripcion: 'Test',
          ubicacion: const Ubicacion(latitud: 0, longitud: 0),
          creadoEn: DateTime.now().subtract(const Duration(seconds: 1)),
        );
        expect(reporte.antiguedad.inMilliseconds, greaterThan(0));
      },
    );
  });
}
