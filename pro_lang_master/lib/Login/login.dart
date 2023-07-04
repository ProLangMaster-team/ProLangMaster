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
            padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
            child: Column(children: <Widget>[
            Container(
            margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 150),
            child: Image.asset('Assets/mercury.png'),
          ),
          Container(
            width: 300,
            child: const TextField(
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  fillColor: Colors.white,
                  hintText: 'Email Address',
                )),
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: const TextField(
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  fillColor: Colors.white,
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.lock),
                )),
          ),
          Container(
            margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Checkbox(value: false, onChanged: null),
                const Text(
                  "Remember password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: const Text(
                    "fogot password?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: const TextButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                      foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    child: Text("Login", style: TextStyle(fontSize: 25)),
                  ),
                ),
                Container(
                  padding: const EdgeInsetsDirectional.all(10),
                  child: const TextButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                      foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    child: Text("Register", style: TextStyle(fontSize: 25)),
                  ),
                ),
              ],
            ),
          ),
              Container(
                  margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                child: const Text("Or connect with", style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),),
              ),
          Container(
            child: TextButton(
              onPressed: null,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              child: Container(
                width: 200,
                child: Row(
                  children: [
                    Image.asset('Assets/google_logo.png'),
                    Container(
                        margin: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: const Text("Login with google")),
                  ],
                ),
              ),

            ),
          ),
        ]),)
    ,
    )
    ,
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
