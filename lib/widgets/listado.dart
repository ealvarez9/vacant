
import 'package:flutter/material.dart';
import 'package:prueba_tec/models/people.dart';
import 'package:prueba_tec/pages/detailPage.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_icons/flutter_icons.dart';

class TarjetasUsuario extends StatelessWidget {
  final User usuario;
  final Color color;
  TarjetasUsuario({
    this.usuario,
    this.color
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                usuario: this.usuario,
                color: this.color,
              );
            },
          ),
        );
      },

      child: Stack(
        children: <Widget>[
          FondoTarjeta(
            height: 120, 
            color: this.color 
          ),
          Container(
            height: 140, 
            margin: EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      SlideInUp(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Hero(
                            tag: usuario.id,
                              child: Image.asset(
                              'assets/images/cuenta.png',
                              width: 70.0,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SlideInRight(
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  usuario.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0
                                  ),
                                ),
                                Text(
                                  usuario.email,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0
                                  ),
                                ),
                                Text(
                                  usuario.phone,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  AntDesign.right,
                  color: Colors.white70,
                  size: 25.0,
                ),
                SizedBox(width: 20.0,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FondoTarjeta extends StatelessWidget {
  const FondoTarjeta({
    Key key,
    @required double height,
    @required Color color,

  }) : _height = height, _color = color, super(key: key);

  final double _height;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      margin: EdgeInsets.only(
        left: 35.0, 
        right:20.0, 
        top: 10.0, 
        bottom: 10.0
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4,6),
            blurRadius: 10.0
          )
        ],
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: <Color>[
            _color.withOpacity(0.9),
            _color,
          ]
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
          child: Stack(
          children: <Widget>[
             Positioned(
              top: -30.0,
              right: -30.0,
              child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color:Color.fromRGBO(255, 255, 255, 0.1),
                  shape: BoxShape.circle
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}