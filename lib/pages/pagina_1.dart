import 'package:flutter/material.dart';
import 'package:singleton_pattern/services/usuario_service.dart';

import '../model/usuario.dart';

class Pagina1Page extends StatelessWidget {
  static const routeName = 'pagina1';
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          return snapshot.hasData
              ? InformacionUsuario(
                  usuario: usuarioService.usuario!,
                )
              : const Center(
                  child: Text('No hay usuario seleccionado'),
                );
        },
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({super.key, required this.usuario});

  final Usuario usuario;

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
          ListTile(title: Text('Nombre: ${usuario.nombre} ')),
          ListTile(title: Text('Edad: ${usuario.edad} ')),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
                'Profesion 1: ${usuario.profesiones.isNotEmpty ? usuario.profesiones.first : ''} '),
          ),
          const ListTile(title: Text('Profesion 1: ')),
          const ListTile(title: Text('Profesion 1: ')),
        ],
      ),
    );
  }
}
