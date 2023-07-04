import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  loginScreen createState() => loginScreen();
}

class loginScreen extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: const Color(0XFF826FA9),
        width: double.maxFinite,
        height: double.maxFinite,
            padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
        child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('Assets/mercury.png'),
                margin: new EdgeInsetsDirectional.fromSTEB(0, 0, 0, 200),
              ),

              Container(
                width: 300,
                child: const TextField(decoration: InputDecoration(
                  filled: true,
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  fillColor: Colors.white,
                  hintText: 'Email Address',
                )),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: const TextField(decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  fillColor: Colors.white,
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.lock),
                )),
              )
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