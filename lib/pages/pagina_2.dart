import 'package:flutter/material.dart';

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
              onPressed: () {},
              child: const Text('Establecer usuario'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
              child: const Text('Cambiar edad'),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {},
              child: const Text('Añadir profesion'),
            ),
          ],
        ),
      ),
    );
  }
}
