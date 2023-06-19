import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_pattern/bloc/user/user_bloc.dart';

import '../model/usuario.dart';

class Pagina2Page extends StatelessWidget {
  static const routeName = 'pagina2';
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
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
                final usuario = Usuario(
                  nombre: 'Fernando Herrera',
                  edad: 35,
                  profesiones: ['Fullstack developer', 'Profesor'],
                );
                BlocProvider.of<UserBloc>(context, listen: false)
                    .add(ActivateUser(usuario));
              },
              child: const Text('Establecer usuario'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false)
                    .add(ChangeAge(35));
              },
              child: const Text('Cambiar edad'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false)
                    .add(AddProfession('Profesor'));
              },
              child: const Text('Añadir profesion'),
            ),
          ],
        ),
      ),
    );
  }
}
