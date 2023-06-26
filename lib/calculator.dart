import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
// import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _displayValue = '';

  void _appendToDisplay(String value) {
    setState(() {
      _displayValue += value;
    });
  }

  void _clearDisplay() {
    setState(() {
      _displayValue = '';
    });
  }

  void _calculateResult() {
    Parser parser = Parser();
    Expression expression = parser.parse(_displayValue);
    ContextModel contextModel = ContextModel();
    double result = expression.evaluate(EvaluationType.REAL, contextModel);

    setState(() {
      _displayValue = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _displayValue,
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Row(
            children: [
              _buildCalculatorButton('7'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('8'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('9'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('/'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _buildCalculatorButton('4'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('5'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('6'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('*'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _buildCalculatorButton('1'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('2'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('3'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('-'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _buildCalculatorButton('0'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('.'),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('='),
              SizedBox(
                width: 10,
              ),
              _buildCalculatorButton('+'),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _clearDisplay,
            child: Text('Clear'),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculatorButton(String label) {
    return Expanded(
      child: Container(
        height:70,
        child: ElevatedButton(
          onPressed: () {
            if (label == '=') {
              _calculateResult();
            } else {
              _appendToDisplay(label);
            }
          },
          child: Text(
            label,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
