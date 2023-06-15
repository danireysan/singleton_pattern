import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_pattern/pages/pagina_1.dart';
import 'package:singleton_pattern/pages/pagina_2.dart';
import 'package:singleton_pattern/services/usuario_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Singleton app',
        initialRoute: Pagina1Page.routeName,
        routes: {
          Pagina1Page.routeName: (_) => const Pagina1Page(),
          Pagina2Page.routeName: (_) => const Pagina2Page(),
        },
      ),
    );
  }
}
