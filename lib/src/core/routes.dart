import 'package:flutter/material.dart';

import '../features/home/ui/home.page.dart';

class Routes {
  static const String initial = '/';
  static const String home = '/home';
  static const String config = '/config';

  static Map<String, Widget Function(BuildContext)> map = {
    initial: (context) => const HomePage(),
    home: (context) => const HomePage(),
    //config: (context) => AtivacaoPage(),
  };
}
