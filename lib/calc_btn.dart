import 'package:flutter/material.dart';

class calc_btn extends StatelessWidget {
  String label;
  Function onClick;


  calc_btn({required this.label, required this.onClick,super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
      onPressed: () {
        onClick(label);
      },
      child: Text(
        "$label",
        style: TextStyle(fontSize: 33, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    ));
  }
}
