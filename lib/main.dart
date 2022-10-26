import 'package:flutter/material.dart';

void main() => runApp(const Calcul());

class Calcul extends StatelessWidget {
  const Calcul({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcButton(String btnTxt, Color colorTxt) {
    return TextButton(
      onPressed: () {
        calculate(btnTxt);
      },
      child: Text(
        btnTxt,
        style: TextStyle(
          fontSize: 35,
          color: colorTxt,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        appBar: AppBar(
          title: const Text('CALCULATOR'),
          centerTitle: true,
          backgroundColor: Colors.green[600],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      text,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  calcButton('RESET', Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  calcButton('7', Colors.white),
                  calcButton('8', Colors.white),
                  calcButton('9', Colors.white),
                  calcButton('×', Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  calcButton('4', Colors.white),
                  calcButton('5', Colors.white),
                  calcButton('6', Colors.white),
                  calcButton('-', Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  calcButton('1', Colors.white),
                  calcButton('2', Colors.white),
                  calcButton('3', Colors.white),
                  calcButton('+', Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  calcButton('0', Colors.white),
                  calcButton('.', Colors.white),
                  calcButton('÷', Colors.white),
                  calcButton('=', Colors.white),
                ],
              ),
            ],
          ),
        ));
  }

  dynamic text = '0', result = '', result2 = '', op = '', op2 = '';
  double numberOne = 0;
  double numberTwo = 0;
  void calculate(btnText) {
    if (btnText == 'RESET') {
      text = '0';
      numberOne = 0;
      numberTwo = 0;
      result = '';
      result2 = '0';
      op = '';
      op2 = '';
    } else if (op == '=' && btnText == '=') {
      if (op == '+') {
        result2 = plus();
      } else if (op2 == '-') {
        result2 = minus();
      } else if (op2 == 'x') {
        result2 = multiplier();
      } else if (op2 == '÷') {
        result2 = diver();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == '×' ||
        btnText == '÷' ||
        btnText == '=') {
      if (numberOne == 0) {
        numberOne = double.parse(result);
      } else {
        numberTwo = double.parse(result);
      }

      if (op == '+') {
        result2 = plus();
      } else if (op == '-') {
        result2 = minus();
      } else if (op == '×') {
        result2 = multiplier();
      } else if (op == '÷') {
        result2 = diver();
      }
      op2 = op;
      op = btnText;
      result = '';
    } else {
      result = result + btnText;
      result2 = result;
    }

    setState(() {
      text = result2;
    });
  }

  String decimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }

  String plus() {
    result = (numberOne + numberTwo).toString();
    numberOne = double.parse(result);
    return decimal(result);
  }

  String minus() {
    result = (numberOne - numberTwo).toString();
    numberOne = double.parse(result);
    return decimal(result);
  }

  String multiplier() {
    result = (numberOne * numberTwo).toString();
    numberOne = double.parse(result);
    return decimal(result);
  }

  String diver() {
    result = (numberOne / numberTwo).toString();
    numberOne = double.parse(result);
    return decimal(result);
  }
}
