import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import 'package:pro_lang_master/Login/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  signup createState() => signup();
}

class signup extends State<SignUp> {
  // Text field controller
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var passwordHidden = true;
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
          padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: Image.asset('Assets/mercury.png'),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: const Text(
                "Sign up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            errorCase
                ? Text(
                    'Username or password incorrect',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  )
                : Container(),
            Container(
              margin: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
              child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.black,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                child: TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.always,
                    // validator: ValidateEmail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                    ))),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
              child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
              child: TextFormField(
                  controller: confirmPasswordController,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      suffixIcon: const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
              child: TextButton(
                onPressed: login,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                child: Text("Sign up", style: TextStyle(fontSize: 20)),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
              child: const Text(
                "-OR-",
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
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: const Text("Login with google")),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: const Text(
                "Already have an account? Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
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
      "full_name": nameController.text,
      "confirm_password": confirmPasswordController.text
    };
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    // var response = await http.get(Uri.parse('https://6e36-184-144-65-222.ngrok-free.app/user/login'));
    Uri uri =
        Uri.parse("https://basically-polished-dassie.ngrok-free.app/user/sign-up");
    // uri.replace(queryParameters: requestBody);
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
      // TODO: logic to redirect to next screen
      setState(() {
        errorCase = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
    }
  }
}
