import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:pro_lang_master/HomePage/question.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Login/CommonComponents/loading.dart';

class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}) : super(key: key);

  @override
  flashCard createState() => flashCard();
}

class flashCard extends State<FlashCard> {
  var errorCase = false;
  var questionIndex = 0;
  var isPageLoading = true;
  GlobalKey<FlipCardState> questionFlashCard = GlobalKey<FlipCardState>();
  final options = [{"value": 'option1', "selected": false }, {"value": 'option1', "selected": false },{"value": 'option1', "selected": false },{"value": 'option1', "selected": false }];
  String selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isPageLoading ? const Loading(): Center(
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
                      key: questionFlashCard,
                      flipOnTouch: false,
                      front: Card(
                        elevation: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Question"),
                            const SizedBox(height: 20),
                            for (var option in options)
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedOption = option['value'] as String;
                                    option['selected'] = !(option['selected'] as bool);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: option["selected"] == false ?
                                        const Color.fromRGBO(255, 255, 255, 1) :
                                        const Color.fromRGBO(109, 72, 188, 1)),
                                child: Text(option['value'] as String, style: TextStyle(
                                  color: option["selected"] == false ?
                                  const Color.fromRGBO(0, 0, 0, 1) :
                                  const Color.fromRGBO(255, 255, 255, 1)),
                                ),
                              ),
                          ],
                        ),
                      ),
                      back: const Card(
                          elevation: 8,
                          child: Center(
                            child: Text("Backside"),
                          ))),
                ),
              ],
            )),
            Container(
              width: 150,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    setState(() {
                      questionFlashCard.currentState?.toggleCard();
                    });
                  });
                },
                child: Text("Next", style: TextStyle(fontSize: 18)),
              ),
            ),
            Container(
              width: 150,
              margin: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0XFF48386A)),
                  foregroundColor:
                  MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    setState(() {
                      questionIndex += 1;
                    });
                  });
                },
                child: Text("Next Question", style: TextStyle(fontSize: 18)),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getAPIData();
  }

  void getAPIData () async {
    final prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('token');
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    var url =
        "https://basically-polished-dassie.ngrok-free.app/course/flashcards";
    Uri uri = Uri.parse(url);
    var requestBody = {
      "course_id": "64b2e582ff47411cbf88db85",
      "token": token,
    };
    print(requestBody);
    print(uri);
    var response = await http.post(uri, headers: headers,body: json.encode(requestBody));
    print(json.decode(response.body));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
