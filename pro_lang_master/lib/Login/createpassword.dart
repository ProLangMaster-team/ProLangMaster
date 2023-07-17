import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pro_lang_master/Login/login.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  newPassword createState() => newPassword();
}

class newPassword extends State<NewPassword> {
  final TextEditingController passwordController = new TextEditingController();
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
                "New Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 140, 5),
              child: const Text(
                "Enter new password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 40,
              child: TextFormField(
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.always,
                  // validator: validatePassword,
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(49)),
                      ),
                      fillColor: Colors.white,
                      hintText: 'Atleast 8 digits',
                      hintStyle: TextStyle(fontSize: 12))),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 158, 5),
              child: const Text(
                "Confirm password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 40,
              child: TextFormField(
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.always,
                  // validator: validatePassword,
                  decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(49)),
                      ),
                      fillColor: Colors.white,
                      hintText: '********',
                      hintStyle: TextStyle(fontSize: 12))),
            ),
            Container(
              width: 150,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: const TextButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                child: Text("Save", style: TextStyle(fontSize: 18)),
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

  void validatePassword() async {
    print(passwordController.text);
    var requestBody = {
      "email": "sample1@sample1.com",
      "password": "abc123",
      "confirm_password": "abc123",
      "tmp_token": "123"
    };
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    // var response = await http.get(Uri.parse('https://6e36-184-144-65-222.ngrok-free.app/user/login'));
    Uri uri = Uri.parse(
        "https://6e36-184-144-65-222.ngrok-free.app/user/reset-password");
    // uri.replace(queryParameters: requestBody);
    print(uri);
    var response =
        await http.put(uri, headers: headers, body: json.encode(requestBody));
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
    }
  }
}
