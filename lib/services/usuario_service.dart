import 'package:flutter/material.dart';
import 'package:singleton_pattern/model/usuario.dart';

class UsuarioService extends ChangeNotifier {
  Usuario? _usuario;

  Usuario get usuario => _usuario ?? Usuario();
  bool get existeUsuario => _usuario != null;

  set usuario(Usuario usuario) {
    _usuario = usuario;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    if (_usuario == null) return;
    _usuario = _usuario!.copyWith(edad: edad);
    notifyListeners();
  }

  void agregarProfesion(String profesion) {
    if (_usuario == null) return;
    _usuario = _usuario!.copyWith(
      profesiones: [..._usuario!.profesiones, profesion],
    );
    notifyListeners();
  }
}
