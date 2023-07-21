import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pro_lang_master/Login/verification.dart';
import 'package:flip_card/flip_card.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  flashCard createState() => flashCard();
}

class flashCard extends State<FlashCard> {
  var errorCase = false;
  final List<String> options = ['option1', 'option2', 'option3', 'option4'];
  String selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 340,
                  height: 400,
                  child: FlipCard(
                      front: Card(
                        elevation: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Question"),
                            SizedBox(height: 20),
                            for (String option in options)
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedOption = option;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(255, 255, 255, 1)),
                                child: Text(option),
                              ),
                          ],
                        ),
                      ),
                      back: Card(
                          elevation: 8,
                          child: Center(
                            child: Text("Backside"),
                          ))),
                ),
              ],
            )),
            Container(
              width: 150,
              margin: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: const TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: null,
                child: Text("Next", style: TextStyle(fontSize: 18)),
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
