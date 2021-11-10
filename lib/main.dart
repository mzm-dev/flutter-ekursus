import 'package:ekursus/pages/bantuan.dart';
import 'package:ekursus/pages/katalog.dart';
import 'package:ekursus/pages/login.dart';
import 'package:ekursus/pages/profil.dart';
import 'package:ekursus/pages/status.dart';
import 'package:flutter/material.dart';
import 'package:ekursus/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white //here you can give the text color
              )),
      title: 'Material App',
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
        '/katalog': (BuildContext context) => KatalogPage(),
        '/profil': (BuildContext context) => ProfilPage(),
        '/status': (BuildContext context) => StatusPage(),
        '/bantuan': (BuildContext context) => BantuanPage(),
        '/login': (BuildContext context) => LoginPage(),
      },
    );
  }
}
