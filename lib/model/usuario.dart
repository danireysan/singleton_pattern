class Usuario {
  final String nombre;
  final int edad;
  List<String> profesiones;

  Usuario({
    this.nombre = '',
    this.edad = 1,
    this.profesiones = const [],
  });

  // create copywith method
  Usuario copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) =>
      Usuario(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones,
      );
}
