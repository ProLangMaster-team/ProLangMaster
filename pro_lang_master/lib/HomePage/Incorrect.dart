import 'package:flutter/material.dart';

class InCorrect extends StatefulWidget {
  const InCorrect({Key? key, required this.correctAnswer}) : super(key: key);
  final String correctAnswer;

  @override
  incorrect createState() => incorrect(correctAnswer);
}

class incorrect extends State<InCorrect> {
  final TextEditingController emailController = new TextEditingController();
  var errorCase = false;

  String correctAnswer;

  incorrect(String this.correctAnswer);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsetsDirectional.fromSTEB(0, 160, 0, 0),
          child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
              child: const Text(
                "Incorrect",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 79.37),
              child: Text(
                "The correct answer is: $correctAnswer",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
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
}
