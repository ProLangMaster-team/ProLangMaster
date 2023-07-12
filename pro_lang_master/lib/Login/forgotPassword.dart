import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  forgotPassword createState() => forgotPassword();
}

class forgotPassword extends State<ForgotPassword> {
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
              child: const TextField(
                  decoration: InputDecoration(
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
              child: const TextButton(
                onPressed: null,
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
              margin: const EdgeInsetsDirectional.fromSTEB(0, 43, 0, 0),
              child: const Text(
                "Back to Sign in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
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
              child: const TextButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                child: Text("Sign up", style: TextStyle(fontSize: 18)),
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
