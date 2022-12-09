
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


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMDb',
      /*theme: ThemeData(
        primarySwatch: Colors.black,
      ),*/
      initialRoute: '/login',
      routes: {
        '/': (context) => MoviesAppHome(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
