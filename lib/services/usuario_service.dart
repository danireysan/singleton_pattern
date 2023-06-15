import 'dart:async';

import 'package:singleton_pattern/model/usuario.dart';

class _UsuarioService {
  Usuario? _usuario;
  final StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();
  Usuario? get usuario => _usuario;

  bool get existeUsuario => (_usuario != null) ? true : false;

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario usuario) {
    _usuario = usuario;
    _usuarioStreamController.add(usuario);
  }

  void cambiarEdad(int edad) {
    _usuario = _usuario!.copyWith(edad: edad);
    _usuarioStreamController.add(_usuario!);
  }

  void agregarProfesion(String profesion) {
    _usuario =
        _usuario!.copyWith(profesiones: [..._usuario!.profesiones, profesion]);
    _usuarioStreamController.add(_usuario!);
  }

  void dispose() => _usuarioStreamController.close();
}

final usuarioService = _UsuarioService();
