import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:singleton_pattern/pages/pagina_1.dart';
import 'package:singleton_pattern/pages/pagina_2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Singleton app',
      initialRoute: Pagina1Page.routeName,
      getPages: [
        GetPage(name: Pagina1Page.routeName, page: () => const Pagina1Page()),
        GetPage(name: Pagina2Page.routeName, page: () => const Pagina2Page()),
      ],
    );
  }
}
