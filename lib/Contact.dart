import 'package:flutter/material.dart';
import 'package:newassignment/Text_Filed.dart';
import 'package:newassignment/card.dart';

import 'ContactsModel.dart';

class Contact extends StatefulWidget {
  Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  List<Contacts> ContactsData = [

    Contacts(),
    Contacts(),
    Contacts(),
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController namecontroller = TextEditingController();
    final TextEditingController phonecontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text("Contacts Screen",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 25,
                color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 15),
            CustomText(
                hintText: "Enter your name",
                icon: Icon(Icons.edit),
                controller: namecontroller),
            SizedBox(height: 20),
            CustomText(
                hintText: "Enter your phone number",
                icon: Icon(Icons.call),
                controller: phonecontroller),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  ContactsData.add(
                      Contacts(
                          name: namecontroller.text,
                          phone: phonecontroller.text));


                  setState(() {

                  });
                },
                child: Text("Add"),
                style: FilledButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Cards(contacts: ContactsData[0]),
                    SizedBox(height: 10,),
                    Cards(contacts: ContactsData[1]),
                    SizedBox(height: 10,),
                    Cards(contacts: ContactsData[2]),
                
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
  void add(){}
  void delate(){}
}
