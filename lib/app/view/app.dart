import 'package:flutter/material.dart';
import 'package:luvit/app/src/theme/luvit_theme.dart';
import 'package:luvit/features/home/page/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LuvitTheme.dartTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
