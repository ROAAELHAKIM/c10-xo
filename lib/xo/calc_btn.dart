import 'package:flutter/material.dart';

class calc_btn extends StatelessWidget {
  String label;
  Function onClick;
  int index;

  calc_btn(
      {required this.index,
      required this.onClick,
      required this.label,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () {
              onClick(index);
            },
            child: Text(
              "$label",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w100,
                  color: Colors.white),
            )));
  }
}
