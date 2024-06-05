import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/core/routes.dart';
import 'src/features/home/ui/home.controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => HomeController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        routes: Routes.map,
        initialRoute: '/',
      ),
    );
  }
}
