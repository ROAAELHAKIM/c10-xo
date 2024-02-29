import 'package:flutter/material.dart';
import 'package:newassignment/ContactsModel.dart';



class Cards extends StatelessWidget {


  final Contacts contacts ;
  Cards({required this.contacts,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration( color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      height: 80,width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name :${contacts.name}"),
              SizedBox(height: 10,),
              Text("Phone :${contacts.phone}"),
            ]),
      ),
    );
  }
}
