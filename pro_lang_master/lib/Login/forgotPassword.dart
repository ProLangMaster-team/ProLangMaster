import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pro_lang_master/Login/createpassword.dart';
import 'package:pro_lang_master/Login/login.dart';
import 'package:pro_lang_master/Login/verification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  forgotpassword createState() => forgotpassword();
}

class forgotpassword extends State<ForgotPassword> {
  final TextEditingController emailController = new TextEditingController();
  var errorCase = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0XFF826FA9),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Container(
          color: const Color(0XFF826FA9),
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: Image.asset('Assets/mercury.png'),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 79.37),
              child: const Text(
                "Forgot Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 43),
              child: const Text(
                "Enter Email Address",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 70,
              child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.always,
                  validator: ValidateEmail,
                  decoration: const InputDecoration(
                    filled: true,
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(49)),
                    ),
                    fillColor: Colors.white,
                    hintText: 'example@gmail.com',
                  )),
            ),
            Container(
              width: 150,
              padding: const EdgeInsetsDirectional.all(10),
              child: TextButton(
                onPressed: forgotPassword,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                child: Text("Send", style: TextStyle(fontSize: 18)),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
              child: const Text(
                "Do you have an account?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 150,
              padding: const EdgeInsetsDirectional.all(10),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  });
                },
                child: Text("Sign in", style: TextStyle(fontSize: 18)),
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

  String? ValidateEmail(String? value) {
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

  void forgotPassword() async {
    print(emailController.text);
    var url =
        "https://basically-polished-dassie.ngrok-free.app/user/reset-password/exist?email=${emailController.text}";
    // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    Uri uri = Uri.parse(url);
    print(uri);
    var response = await http.get(uri);
    print(response.statusCode);
    print(json.decode(response.body));
    if (json.decode(response.body)['status'] == 'error' || !json.decode(response.body)["data"]["exist"]) {
      print('Error');
      setState(() {
        errorCase = true;
      });
    } else {
      setState(() {
        errorCase = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewPassword(token: json.decode(response.body)['data']['tmp_token'])),
        );
      });
    }
  }
}
