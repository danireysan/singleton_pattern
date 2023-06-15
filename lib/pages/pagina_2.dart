import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/usuario.dart';
import '../services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  static const routeName = 'pagina2';
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          usuarioService.existeUsuario
              ? usuarioService.usuario.nombre
              : 'Pagina 2',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(
                  context,
                  listen: false,
                );

                final newUsers = Usuario(
                  nombre: 'Fernando Herrera',
                  edad: 20,
                  profesiones: ['Fullstack developer', 'Profesor'],
                );
                usuarioService.usuario = newUsers;
              },
              child: const Text('Establecer usuario'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(
                  context,
                  listen: false,
                );

                usuarioService.cambiarEdad(30);
              },
              child: const Text('Cambiar edad'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(
                  context,
                  listen: false,
                );

                usuarioService.agregarProfesion('Traductor');
              },
              child: const Text('Añadir profesion'),
            ),
          ],
        ),
      ),
    );
  }
}
