import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_pattern/model/usuario.dart';

import '../bloc/user/user_bloc.dart';

class Pagina1Page extends StatelessWidget {
  static const routeName = 'pagina1';
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false)
                  .add(EraseUserEvent());
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state is UserLoadedState) {
            final loadedState = state;
            return InformacionUsuario(loadedState.user!);
          }
          return const Center(
            child: Text('No hay usuario seleccionado'),
          );
        },
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario(this.user, {super.key});

  final Usuario user;

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
          ListTile(title: Text('Nombre: ${user.nombre} ')),
          ListTile(title: Text('Edad: ${user.edad}')),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...user.profesiones
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
