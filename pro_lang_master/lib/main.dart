import 'package:flutter/material.dart';
import 'package:pro_lang_master/Login/forgotPassword.dart';
import 'package:pro_lang_master/Login/login.dart';
import 'package:pro_lang_master/Login/signUp.dart';
import 'package:pro_lang_master/Login/verification.dart';
import 'package:pro_lang_master/Login/login.dart';
import 'package:pro_lang_master/Login/selectLanguage.dart';
import 'package:pro_lang_master/Login/verification.dart';
import 'package:pro_lang_master/Login/Fluencylevel.dart';
import 'package:pro_lang_master/Login/UserDetails.dart';
import 'package:pro_lang_master/Login/flashcardQuestion.dart';
import 'package:pro_lang_master/Login/loading.dart';
import 'package:pro_lang_master/Login/createpassword.dart';
import 'package:pro_lang_master/Login/forgotPassword.dart';
import 'package:pro_lang_master/Login/login.dart';
import 'package:pro_lang_master/Login/verification.dart';
import 'package:pro_lang_master/Login/login.dart';
import 'package:pro_lang_master/HomePage/selectLanguage.dart';
import 'package:pro_lang_master/Login/verification.dart';
import 'package:pro_lang_master/HomePage/Fluencylevel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[LoginScreen()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
