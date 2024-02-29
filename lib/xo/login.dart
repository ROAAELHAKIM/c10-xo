import 'package:flutter/material.dart';
import 'package:newassignment/xo/playersmodel.dart';
import 'package:newassignment/xo/xo_game.dart';

class login extends StatelessWidget {
   login({super.key});
  TextEditingController player1 =TextEditingController();
  TextEditingController player2 =TextEditingController();
  static const String routeName="LOGIN";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          TextField(
            controller: player1,
            decoration: InputDecoration(label: Text("player one",),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            controller: player2,
            decoration: InputDecoration(label: Text("player two",),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {

                Navigator.of(context).pushNamed(xo_game.routeName ,
                arguments: PlayersModel(player1.text, player2.text)
                );
              }, child: Text("Lets go"))
        ]),
      ),
    );
  }
}
