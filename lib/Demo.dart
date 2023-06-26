import 'package:app/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({Key? key}) : super(key: key);

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back),
      //   title: Text("Sing in"),
      //   titleSpacing: 0,
      // ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(child: Image.asset("assets/icons/loogo.png")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),

                    ),
                    hintText: "Email",
                    prefixIconColor: Colors.black,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                  ),
                  validator: (value) {
                    print(value);
                    if (value == null || value.isEmpty) {
                      return "Please enter some value.";
                    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                      return "Please enter valid email.";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: "Password",
                    prefixIconColor: Colors.black,
                    prefixIcon: Icon(
                      Icons.password_rounded,
                      color: Colors.grey,
                    ),
                    suffixIconColor: Colors.grey,
                    suffixIcon: IconButton(
                      onPressed: () {
                        isPasswordVisible = !isPasswordVisible;
                        print("$isPasswordVisible");
                        setState(() {});
                      },
                      icon: Icon(isPasswordVisible
                          ? Icons.remove_red_eye
                          : Icons.not_interested),
                    ),
                  ),
                  obscureText: !isPasswordVisible,
                  validator: (value) {
                    print(value);
                    if (value == null || value.isEmpty) {
                      return "Please enter some value.";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  // alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      print("sign in");
                      print("Email : ${emailController.text.toString()}");

                      if (formKey.currentState!.validate()) {
                        print("validated");
                      }
                    },
                    child: Text("Sign in"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an accoutn? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
