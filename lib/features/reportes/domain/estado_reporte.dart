sealed class EstadoReporte {
  const EstadoReporte();
}

final class Borrador extends EstadoReporte {
  const Borrador();
}

final class Enviado extends EstadoReporte {
  const Enviado(this.enviadoEn);
  final DateTime enviadoEn;
}

final class EnRevision extends EstadoReporte {
  const EnRevision(this.asignadoA);
  final String asignadoA;
}

final class Resuelto extends EstadoReporte {
  const Resuelto(this.resueltoEn, this.evidencia);
  final DateTime resueltoEn;
  final String evidencia;
}

final class Rechazado extends EstadoReporte {
  const Rechazado(this.motivo);
  final String motivo;
}

extension Transiciones on EstadoReporte {
  bool puedeEditar() => switch (this) {
    Borrador() => true,
    Enviado() => true,
    EnRevision() => false,
    Resuelto() => false,
    Rechazado() => true,
  };

  String get etiqueta => switch (this) {
    Borrador() => 'Borrador',
    Enviado(:final enviadoEn) => 'Enviado el ${enviadoEn.day}',
    EnRevision(:final asignadoA) => 'En revisión · $asignadoA',
    Resuelto() => 'Resuelto',
    Rechazado(:final motivo) => 'Rechazado: $motivo',
  };
}
