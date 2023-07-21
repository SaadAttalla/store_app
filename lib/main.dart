import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'package:store_app/pages/Card.dart';
import 'package:store_app/pages/Checkout.dart';
import 'package:store_app/pages/Register.dart';
import 'package:store_app/pages/home.dart';
import 'package:store_app/pages/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> Cardd(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
          routes: {
          'Login': (context) =>Login(),
            'Register': (context) => Login(),
            'Register': (context) => Register(),
            'home': (context) => home(),
            'Appbar' : (context) => AppBar(),
            'Checkout': (context) => Checkout(),



          },
          initialRoute:    'home'
      ),
    );
  }
}

