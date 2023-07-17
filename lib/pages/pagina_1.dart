import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/usuario_controller.dart';
import '../model/usuario.dart';

class Pagina1Page extends StatelessWidget {
  static const routeName = '/pagina1';
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());
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
      body: Obx(
        () => usuarioCtrl.existeUsuario.value
            ? InformacionUsuario(
                usuario: usuarioCtrl.usuario.value,
              )
            : const NoInfo(),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No hay informacion del usuario'));
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
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...usuario.profesiones.map((e) => ListTile(
                title: Text(e),
              )),
        ],
      ),
    );
  }
}
