import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({required this.controller,required this.icon, required this.hintText, super.key});

  String hintText;
  Widget icon;
  TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(controller: controller,
      decoration: InputDecoration(
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(30)),
        focusedBorder:
        OutlineInputBorder( borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(35)),
        hintText: hintText,
        suffixIcon: icon,
        filled: true,
        fillColor: Colors.white,
        suffixIconColor: Colors.cyan,
        hintStyle:
        TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),
    );
  }
}
