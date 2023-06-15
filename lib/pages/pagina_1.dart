import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_pattern/model/usuario.dart';

import '../services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  static const routeName = 'pagina1';
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagina 1'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigate_next),
          onPressed: () {
            Navigator.pushNamed(context, 'pagina2');
          },
        ),
        body: usuarioService.existeUsuario
            ? InformacionUsuario(
                usuario: usuarioService.usuario,
              )
            : const Center(
                child: Text('No hay usuario seleccionado'),
              ));
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}} ')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...usuario.profesiones
              .map(
                (profesion) => ListTile(
                  title: Text(profesion),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
