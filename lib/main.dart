import 'package:flutter/material.dart';
import 'package:prueba_tec/pages/detailPage.dart';
import 'package:prueba_tec/pages/homePage.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Vacant-t',
      initialRoute: 'Home', 
      routes: {
        'Home'        : ( BuildContext context ) => HomePage(),
        'DetailPage'  : ( BuildContext context ) => DetailPage(),
      },
    );
  }
}