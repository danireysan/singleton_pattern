import 'package:flutter/material.dart';
import 'package:singleton_pattern/services/usuario_service.dart';

import '../model/usuario.dart';

class Pagina2Page extends StatelessWidget {
  static const routeName = 'pagina2';
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data!.nombre)
                : const Text('Pagina 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final usuario = Usuario(
                  nombre: 'Juan',
                  edad: 23,
                );
                usuarioService.cargarUsuario(usuario);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('Establecer usuario'),
            ),
            MaterialButton(
              onPressed: () {
                usuarioService.cambiarEdad(30);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text('Cambiar edad'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                usuarioService.agregarProfesion('Programador');
              },
              child: const Text('Añadir profesion'),
            ),
          ],
        ),
      ),
    );
  }
}
