import 'package:flutter/material.dart';
import 'package:newassignment/calc_btn.dart';

class calculator extends StatefulWidget {
  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String displayResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            //color: Colors.red,
            child: Text(
              displayResult,
              style: TextStyle(fontSize: 33),
            ),
          ),
        ),
        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            calc_btn(
              label: "9",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: "8",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: "7",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: "/",
              onClick: onOperatorClick,
            ),
          ]),
        ),
        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            calc_btn(
              label: "6",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: "5",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: "4",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: "*",
              onClick: onOperatorClick,
            ),
          ]),
        ),
        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            calc_btn(
              label: "3",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: "2",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: "1",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: "-",
              onClick: onOperatorClick,
            ),
          ]),
        ),
        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            calc_btn(
              label: "0",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: ".",
              onClick: clickedBtn,
            ),
            calc_btn(
              label: "=",
              onClick: onEqualClick,
            ),
            calc_btn(
              label: "+",
              onClick: onOperatorClick,
            ),
          ]),
        ),
      ]),
    );
  }

  clickedBtn(label) {
    if (op == "=") {
      displayResult = "";
      op = "";
      lhs = "";
    }
    displayResult += label;
    setState(() {});
  }

  String calculate(String lhs, String rhs, String op) {
    double LHS = double.parse(lhs);
    double RHS = double.parse(rhs);
    if (op == "+") {
      double res = LHS + RHS;
      return res.toString();
    } else if (op == "-") {
      double res = LHS - RHS;
      return res.toString();
    } else if (op == "*") {
      double res = LHS * RHS;
      return res.toString();
    } else if (op == "/") {
      double res = LHS / RHS;
      return res.toString();
    }
    return "";
  }

  onEqualClick(equalOperator) {
    displayResult = calculate(lhs, displayResult, op);
    op = equalOperator;

    setState(() {});
  }

  String lhs = "";
  String rhs = "";
  String op = "";

  onOperatorClick(operation) {
    if (op.isEmpty) {
      lhs = displayResult;
    } else {
      lhs = calculate(lhs, displayResult, op);
    }
    op = operation;

    displayResult = "";
    setState(() {});
  }
}
