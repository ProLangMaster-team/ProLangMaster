import 'package:flutter/material.dart';
import 'package:pro_lang_master/Login/login.dart';
<<<<<<< Updated upstream

import 'package:pro_lang_master/Login/selectLanguage.dart';
import 'package:pro_lang_master/Login/Fluencylevel.dart';
import 'package:pro_lang_master/Login/Goalsetup.dart';
import 'package:pro_lang_master/Login/question.dart';
import 'package:pro_lang_master/Login/forgotPassword.dart';
=======
import 'package:pro_lang_master/Login/selectLanguage.dart';
>>>>>>> Stashed changes
import 'package:pro_lang_master/Login/verification.dart';
import 'package:pro_lang_master/Login/Fluencylevel.dart';

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
<<<<<<< Updated upstream
      home: const ForgotPassword(),
=======
      home: const FluencyLevel(),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          children: <Widget>[ForgotPassword()],
=======
          children: <Widget>[FluencyLevel()],
>>>>>>> Stashed changes
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
