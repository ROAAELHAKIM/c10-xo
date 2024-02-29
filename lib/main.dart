import 'package:flutter/material.dart';
import 'package:newassignment/session.dart';
import 'package:newassignment/xo/login.dart';
import 'package:newassignment/xo/xo_game.dart';

import 'calculator.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:login.routeName ,
      routes: {login.routeName:(context) => login(),
        xo_game.routeName:(context) =>  xo_game(),
      },

    );
  }
}

