import 'package:app/Demo.dart';
import 'package:app/Live.dart';
import 'package:app/Todolist.dart';
import 'package:app/calculator.dart';
import 'package:app/login_page.dart';
import 'package:app/practice.dart';
import 'package:app/tictactoe.dart';
import 'package:flutter/material.dart';
import 'bmi.dart';
import 'register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: DefaultTabController(
          length:6,
          child: Scaffold(
            appBar:AppBar(
              title:Text("XYZ"),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.login)),
                  Tab(icon: Icon(Icons.app_registration)),
                  Tab(icon: Icon(Icons.task)),
                  Tab(icon: Icon(Icons.calculate_outlined)),
                  Tab(icon: Icon(Icons.health_and_safety)),
                  Tab(icon: Icon(Icons.gamepad_outlined)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                DemoScreen(),
                RegisterPage(),
                Practice(),
                CalculatorApp(),
                Bmi(),
                TicTacToeApp(),
              ],
            ),
          )

      ),
      routes: {
        '/signup': (context) => DemoScreen(),
      },
    );
  }
}
