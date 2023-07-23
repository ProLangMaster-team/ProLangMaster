import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pro_lang_master/Login/login.dart';
import 'package:pro_lang_master/Login/verification.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  userDetails createState() => userDetails();
}

class userDetails extends State<UserDetails> {
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
          padding: const EdgeInsetsDirectional.fromSTEB(0, 41, 0, 0),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
              child: Image.asset('Assets/Vector (1).jpg'),
            ),
            Container(
              width: 320,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: const Text(
                "Username",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 330,
              height: 40,
              child: TextFormField(
                  decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                fillColor: Colors.white,
                hintText: 'ABC',
              )),
            ),
            Container(
              width: 320,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: const Text(
                "Email Id",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 330,
              height: 40,
              child: TextFormField(
                  decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                fillColor: Colors.white,
                hintText: 'abc@gmail.com',
              )),
            ),
            Container(
              width: 320,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: const Text(
                "Phone Number",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 330,
              height: 40,
              child: TextFormField(
                  decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                fillColor: Colors.white,
                hintText: '+1 0000000000',
              )),
            ),
            Container(
              width: 320,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: const Text(
                "Password",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 330,
              height: 40,
              child: TextFormField(
                  decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                fillColor: Colors.white,
                hintText: 'abcdefgh',
              )),
            ),
            Container(
              width: 190,
              margin: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 10),
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
                child: Text("Update", style: TextStyle(fontSize: 18)),
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
}
