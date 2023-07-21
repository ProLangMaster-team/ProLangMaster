import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  question createState() => question();
}

class question extends State<Question> {
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
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: Image.asset('Assets/mercury.png'),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 36),
              child: const Text(
                "QUESTION",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              height: 60,
              width: 318,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(255, 255, 255, 0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      // spreadRadius: 15,
                      // // blurRadius: 15,
                      // offset: Offset(0.0, 0.75),
                    )
                  ]),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'OPTION',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 318,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(255, 255, 255, 0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      // spreadRadius: 15,
                      // // blurRadius: 15,
                      // offset: Offset(0.0, 0.75),
                    )
                  ]),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'OPTION',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 318,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(255, 255, 255, 0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      // spreadRadius: 15,
                      // // blurRadius: 15,
                      // offset: Offset(0.0, 0.75),
                    )
                  ]),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'OPTION',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 318,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 1),
                      Color.fromRGBO(255, 255, 255, 0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      // spreadRadius: 15,
                      // // blurRadius: 15,
                      // offset: Offset(0.0, 0.75),
                    )
                  ]),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'OPTION',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 0.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(42, 119, 42, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                // border: Border.all(width: 1.0),
                color: Color(0xB2FFFFFF),
              ),
              child: Column(children: <Widget>[
                Row(
                  children: [
                    const Checkbox(value: false, onChanged: null),
                    SizedBox(width: 80),
                    const Text(
                      "Daily",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Checkbox(value: false, onChanged: null),
                    SizedBox(width: 53),
                    const Text(
                      "Every Two days",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Checkbox(value: false, onChanged: null),
                    SizedBox(width: 49),
                    const Text(
                      "Weekly",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ]),
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
