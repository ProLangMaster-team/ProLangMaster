import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pro_lang_master/HomePage/flashcardQuestion.dart';

class FluencyLevel extends StatefulWidget {
  const FluencyLevel({Key? key}) : super(key: key);

  @override
  fluencyLevel createState() => fluencyLevel();
}

class fluencyLevel extends State<FluencyLevel> {
  var noProficiency = false;
  var elementary = false;
  var professional = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0XFF826FA9),
        leading: const BackButton(
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
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: const Text(
                "Level of Fluency",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(42, 119, 42, 0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                // border: Border.all(width: 1.0),
                color: Color(0xB2FFFFFF),
              ),
              child: Column(children: <Widget>[
                Row(
                  children: [
                    Checkbox(value: noProficiency, onChanged: (value) {
                      setState(() {
                        noProficiency = value!;
                        elementary = false;
                        professional = false;
                      });
                    }),
                    const SizedBox(width: 80),
                    const Text(
                      "No Proficiency",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Checkbox(value: false, onChanged: null),
                    SizedBox(width: 53),
                    Text(
                      "Elementary Proficiency",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Checkbox(value: false, onChanged: null),
                    SizedBox(width: 49),
                    Text(
                      "Professional Proficiency",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            TextButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FlashCard()),
              );
            }, child: Text("Next")),
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
