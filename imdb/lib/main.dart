
import 'dart:io';
import '../firebase/firebase_options.dart';
import '../Pages/MoviesAppHome.dart';
import '../Pages/login.dart';
import '../Pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  }
  else { 
    await Firebase.initializeApp(); 
  }
  runApp(const MyApp());
}
  bool iconBool=false;

  ThemeData _darkTheme=ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
  );

  ThemeData _lightTheme=ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
  );

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:iconBool ? _darkTheme : _lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'IMDb',
      initialRoute: '/login',
      routes: {
        '/': (context) => MoviesAppHome(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
