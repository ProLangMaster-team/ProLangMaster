import 'dart:ffi';

import 'package:flutter/material.dart';

class selectLanguage extends StatefulWidget {
  const selectLanguage({Key? key}) : super(key: key);

  @override
  chooseLanguage createState() => chooseLanguage();
}

class chooseLanguage extends State<selectLanguage> {
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
                "Choose language to get fluent:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('Assets/India.jpg'),
                    SizedBox(
                      width: 110,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {},
                      child: const Text('HINDI'),
                    ),
                  ]),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('Assets/canada.jpg'),
                    SizedBox(
                      width: 90,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {},
                      child: const Text('FRENCH'),
                    ),
                  ]),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('Assets/pakistan.jpg'),
                    SizedBox(
                      width: 111,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {},
                      child: const Text('URDU'),
                    ),
                  ]),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('Assets/unitedKingdom.jpg'),
                    SizedBox(
                      width: 86,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {},
                      child: const Text('ENGLISH'),
                    ),
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
