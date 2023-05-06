import 'package:coursditi/screens/home_page.dart';
import 'package:coursditi/screens/navigation_page.dart';
import 'package:coursditi/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      //home: const MyHomePage(title: 'Orange et Moi'),
      home: const SplashScreen(),
    );
  }
}


