import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueba_tec/data/userData.dart';
import 'package:prueba_tec/models/people.dart';
import 'package:prueba_tec/widgets/listado.dart';
import 'package:random_color/random_color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

TabController tabController;

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    tabController = new TabController(length: 3, vsync: this); 
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ), 
          onPressed: (){}
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ), 
            onPressed: (){}
          )
        ],
        flexibleSpace: Container(
          height: 240.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Colors.purpleAccent,
                Colors.purple,
              ]
            ),
          ),
        ),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
          unselectedLabelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
          tabs: [
            Tab(text: 'Designer',),
            Tab(text: 'Category',),
            Tab(text: 'Attention',)
          ],
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
        ),
        bottomOpacity: 1.0,
      ),
      
      body: Usuarios(),
    );
  }
}


class Usuarios extends StatefulWidget {
  @override
  _UsuariosState createState() => _UsuariosState();
}

class _UsuariosState extends State<Usuarios> {
  
  var users = new List<User>();
  RandomColor _randomColor = RandomColor();

  _getUsers() {
    UserData.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }
  
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: users.length,
        itemBuilder: (context, index){
          User ellos = users[index];
          return  TarjetasUsuario(
            usuario: ellos,
            color: _randomColor.randomColor(colorHue: ColorHue.purple),
          );
        },
      ),
    );
  }
}