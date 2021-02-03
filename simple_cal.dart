import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(
      () {
        if (buttonText == "C") {
          equation = "0";
          result = "0";
          equationFontSize = 38.0;
          resultFontSize = 48.0;
        } else if (buttonText == "⌫") {
          equation = equation.substring(0, equation.length - 1);
          equationFontSize = 48.0;
          resultFontSize = 38.0;
        } else if (buttonText == "=") {
          equationFontSize = 38.0;
          resultFontSize = 48.0;
          expression = equation;
          expression = expression.replaceAll('×', '*');
          expression = expression.replaceAll('÷', '/');

          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);

            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (e) {
            result = "Error";
          }
        } else {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          if (equation == "0") {
            equation = buttonText;
          } else {
            equation = equation + buttonText;
          }
        }
      },
    );
  }

  Widget myButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      margin: EdgeInsets.all(2.0),
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      child: FlatButton(
        color: buttonColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(
                color: Colors.black, width: 1, style: BorderStyle.solid)),
        onPressed: () => buttonPressed(buttonText),
        padding: EdgeInsets.all(8.0),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        myButton("C", 1, Colors.orange[900]),
                        myButton("⌫", 1, Colors.amber[300]),
                        myButton("÷", 1, Colors.amber[300]),
                      ],
                    ),
                    TableRow(
                      children: [
                        myButton("7", 1, Colors.black87),
                        myButton("8", 1, Colors.black87),
                        myButton("9", 1, Colors.black87),
                      ],
                    ),
                    TableRow(
                      children: [
                        myButton("4", 1, Colors.black87),
                        myButton("5", 1, Colors.black87),
                        myButton("6", 1, Colors.black87),
                      ],
                    ),
                    TableRow(
                      children: [
                        myButton("1", 1, Colors.black87),
                        myButton("2", 1, Colors.black87),
                        myButton("3", 1, Colors.black87),
                      ],
                    ),
                    TableRow(
                      children: [
                        myButton(".", 1, Colors.black87),
                        myButton("0", 1, Colors.black87),
                        myButton("00", 1, Colors.black87),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        myButton("×", 1, Colors.amber[300]),
                      ],
                    ),
                    TableRow(
                      children: [
                        myButton("+", 1, Colors.amber[300]),
                      ],
                    ),
                    TableRow(
                      children: [
                        myButton("-", 1, Colors.amber[300]),
                      ],
                    ),
                    TableRow(
                      children: [
                        myButton("=", 2, Colors.redAccent[100]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
