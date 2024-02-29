import 'package:flutter/material.dart';

import 'contacts.dart';

class session extends StatefulWidget {
  const session({super.key});

  @override
  State<session> createState() => _sessionState();
}

class _sessionState extends State<session> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  List<Contacts> contact = List.empty(growable: true);


  final GlobalKey<FormState> fromstate = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Contacts Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          color: Colors.grey,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: fromstate,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return "name cant be empty ";

                          }
                          return null;
                        },
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          hintText: "Enter your name",
                          suffixIcon: Icon(
                            Icons.edit,
                            size: 33,
                            color: Colors.blue,
                          ),
                        ),

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return " phone number cant be empty ";

                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: numberController,
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          hintText: "Enter your phone number",
                          suffixIcon: Icon(
                            Icons.call,
                            size: 33,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if(fromstate.currentState!.validate()){
                            print("valid");
                          }else{
                            print("not valid");
                          }

                          String name = nameController.text;
                          String number = numberController.text;
                         // contact.add(Contacts(name: name, number: number));


                          //setState(() {});

                          if (name.isNotEmpty && number.isNotEmpty) {
                            setState(() {
                              contact.add(Contacts(name: name, number: number));
                              nameController.clear();
                              numberController.clear();

                            });
                          }else{
                            setState(() {

                            });
                          }
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            minimumSize: Size(380, 60)),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                //--------------------
                Expanded(
                  child: ListView.builder(
                    itemCount: contact.length,
                    itemBuilder: (context, index) => getInfo(index),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget getInfo(int index) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                "Name:",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                contact[index].name,
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Phone:",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                contact[index].number,
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ]),
        trailing: InkWell(
            onTap: () {
              setState(() {
                contact.removeAt(index);
              });
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
              size: 33,
            )),
      ),
    );
  }
}

// Row(children: [
//
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
//

// ],)],),
