import 'dart:math';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  // void initState(){
  //   super.initState();
  //   createPerson();
  // }
  TextEditingController theight = TextEditingController();
  TextEditingController tweight = TextEditingController();
  List<String> answer = ['Underweight', 'Healthy weight', 'Overweight', 'Obese'];
  var uwimg = Image.asset('assets/icons/underweight.jpg');
  var nwimg = Image.asset('assets/icons/normalweight.jpg');
  var owimg = Image.asset("assets/icons/overweight.jpg");
  var obimg = Image.asset("assets/icons/obese.jpg");
  var gender = "male";
  var height;
  var weight;
  var ans;
  var ansimg;
  double bmi = 0;
  var img;
  bool clicked = false;

  double calculate() {
    bmi = weight / ((height / 100) * (height / 100));
    return bmi;
  }

  Widget createPerson() {
    if (bmi < 18.5 && clicked) {
      return Row(
        children: [
          Expanded(flex: 2, child: uwimg),
          Expanded(child: nwimg),
          Expanded(child: owimg),
          Expanded(child: obimg),
        ],
      );
    } else if (bmi > 18.5 && bmi < 24.9 && clicked) {
      return Row(
        children: [
          Expanded(child: uwimg),
          Expanded(flex: 2, child: nwimg),
          Expanded(child: owimg),
          Expanded(child: obimg),
        ],
      );
    } else if (bmi > 24.9 && bmi < 29.9 && clicked) {
      return Row(
        children: [
          Expanded(child: uwimg),
          Expanded(child: nwimg),
          Expanded(flex: 2, child: owimg),
          Expanded(child: obimg),
        ],
      );
    } else if (bmi > 29.9 && clicked) {
      return Row(
        children: [
          Expanded(child: uwimg),
          Expanded(child: nwimg),
          Expanded(child: owimg),
          Expanded(flex: 2, child: obimg),
        ],
      );
    }
    return Row(
      children: [
        Expanded(child: uwimg),
        Expanded(child: nwimg),
        Expanded(child: owimg),
        Expanded(child: obimg),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate BMI Index"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: theight,
                  decoration: InputDecoration(
                    hintText: "Enter your weight",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == '0' || value == null || value.isEmpty) {
                      print("This field cannot be zero or empty");
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      weight = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: tweight,
                  decoration: InputDecoration(
                    hintText: "Enter your height",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == '0' || value == null || value.isEmpty) {
                      print("This field cannot be zero or empty");
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      height = double.tryParse(value) ?? 0;
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: Text("Male"),
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: Text("Female"),
                        value: "female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      bmi = calculate();
                      clicked = true;
                    });
                  },
                  child: Text("Calculate"),
                ),
                Text(
                  'BMI: ${bmi.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 24.0),
                ),
                createPerson(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
