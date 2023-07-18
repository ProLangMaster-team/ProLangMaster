import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
          padding: const EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
              child: Image.asset('Assets/Vector (1).jpg'),
            ),
            Container(
              width: 330,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: const Text(
                "Username",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
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
              width: 330,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: const Text(
                "Email Id",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
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
              width: 330,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: const Text(
                "Phone Number",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
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
              width: 330,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: const Text(
                "Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
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
                hintText: 'abcdefgh',
              )),
            ),
            Container(
              width: 150,
              margin: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              child: TextButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
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
