import 'package:flutter/material.dart';
import 'package:prueba_tec/models/people.dart';

class DetailPage extends StatelessWidget {
  final User usuario;
  final Color color;
  DetailPage({
    this.usuario,
    this.color
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 2),
        width: double.infinity,
        decoration: BoxDecoration(
          color: this.color
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: this.usuario.id,
                    child: Image.asset(
                    'assets/images/cuenta.png',
                    width: 100.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  this.usuario.name,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                  ),
                ),
                Text(
                  this.usuario.username,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white
                  ),
                ),
                Text(
                  this.usuario.email,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Divider(
                    color: Colors.white,
                  )
                ),
                Text(
                  this.usuario.phone,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}