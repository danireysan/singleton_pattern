import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_pattern/controllers/usuario_controller.dart';

import '../model/usuario.dart';

class Pagina2Page extends StatelessWidget {
  static const routeName = '/pagina2';
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                usuarioCtrl.cargarUsuario(
                  Usuario(
                    nombre: 'Juan',
                    edad: 23,
                    profesiones: ['Ingeniero', 'Programador'],
                  ),
                );
                Get.snackbar("Usuario establecido",
                    "El usuario se ha establecido correctamente",
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                    boxShadows: [
                      const BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 10,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ]);
              },
              child: const Text('Establecer usuario'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                usuarioCtrl.cambiarEdad(30);
              },
              child: const Text('Cambiar edad'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                usuarioCtrl.agregarProfesion(
                    "Profesión ${usuarioCtrl.profesionesCount + 1}");
              },
              child: const Text('Añadir profesion'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                );
              },
              child: const Text('Cambiar tema'),
            ),
          ],
        ),
      ),
    );
  }
}
