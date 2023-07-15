import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  newPassword createState() => newPassword();
}

class newPassword extends State<NewPassword> {
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
              child: const TextField(
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
              child: const TextField(
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
}
