import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pro_lang_master/HomePage/selectLanguage.dart';
import 'package:pro_lang_master/Login/CommonComponents/loading.dart';
import 'package:pro_lang_master/Login/forgotPassword.dart';
import 'package:pro_lang_master/Login/signUp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  loginScreen createState() => loginScreen();
}

class loginScreen extends State<LoginScreen> {
  // Text field controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var passwordHidden = true;
  var errorCase = false;
  var selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Container(
          color: const Color(0XFF826FA9),
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 150),
              child: Image.asset('Assets/mercury.png'),
            ),
            errorCase
                ? const Text(
                    'Username or password incorrect',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  )
                : Container(),
            Container(
              width: 300,
              child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.always,
                  validator: validateEmail,
                  decoration: const InputDecoration(
                    filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    fillColor: Colors.white,
                    hintText: 'Email Address',
                  )),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: TextField(
                  controller: passwordController,
                  obscureText: passwordHidden,
                  decoration: InputDecoration(
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      fillColor: Colors.white,
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(passwordHidden
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            passwordHidden = !passwordHidden;
                          });
                        },
                      ))),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Checkbox(value: false, onChanged: null),
                  const Text(
                    "Remember password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPassword()),
                          );
                        });
                      },
                      child: const Text("forgot password?",
                        style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.all(10),
                    child: TextButton(
                      onPressed: login,
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                        foregroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      child: const Text("Login", style: TextStyle(fontSize: 25)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(10),
                    child: TextButton(
                      onPressed: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      }),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                        foregroundColor:
                            MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      child: Text("Register", style: TextStyle(fontSize: 25)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
              child: const Text(
                "Or connect with",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: null,
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                child: Container(
                  width: 200,
                  child: Row(
                    children: [
                      Image.asset('Assets/google_logo.png'),
                      Container(
                          margin:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: const Text("Login with google")),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  void login() async {
    print(emailController.text);
    print(passwordController.text);
    var requestBody = {
      "email": emailController.text,
      "password": passwordController.text,
    };
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    Uri uri = Uri.parse("https://basically-polished-dassie.ngrok-free.app/user/login");
    print(uri);
    var response =
        await http.post(uri, headers: headers, body: json.encode(requestBody));
    print(response.statusCode);
    print(json.decode(response.body));
    if (json.decode(response.body)['status'] == 'error') {
      print('Error');
      setState(() {
        errorCase = true;
      });
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', json.decode(response.body)['data']['token']);
      setState(() {
        errorCase = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => selectLanguage()),
        );
      });
    }
  }
}
