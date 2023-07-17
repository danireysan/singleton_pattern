import 'package:get/get.dart';
import 'package:singleton_pattern/model/usuario.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  get profesionesCount {
    return usuario.value.profesiones.length;
  }

  void cargarUsuario(Usuario user) {
    usuario.value = user;
    existeUsuario.value = true;
  }

  void cambiarEdad(int edad) {
    usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    usuario.update((val) {
      val!.profesiones = [...val.profesiones, profesion];
    });
  }
}
