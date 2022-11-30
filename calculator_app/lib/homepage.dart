// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String question = "";
  String answer = "";

  void buttonPressed(String value) {
    setState(() {
      question += value;
    });
  }

  void onCEPressed(String value) {
    setState(() {
      question = value.substring(0, value.length - 1);
    });
  }

  void onEqualPressed() {
    String inputQuestion = question;
    inputQuestion = inputQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(inputQuestion);
    ContextModel contextModel = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }

  Row buildButton(
      {String? text1, String? text2, String? text3, String? text4}) {
    return Row(
      children: <Widget>[
        Container(
          height: 50,
          width: 75,
          child: MaterialButton(
            color: Colors.white,
            onPressed: () {
              if (text1 == 'AC') {
                buttonPressed(question = "");
                buttonPressed(answer = "");
              } else {
                buttonPressed(text1!);
              }
            },

            // ignore: sort_child_properties_last
            child: Text(
              text1!,
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            //shape: const CircleBorder(side: BorderSide(width: 0.0)),
          ),
        ),
        const SizedBox(
          height: 80,
          width: 15,
        ),
        Container(
          height: 50,
          width: 80,
          child: MaterialButton(
            color: Colors.white,
            onPressed: () {
              if (text2 == "CE") {
                onCEPressed(question);
                buttonPressed(answer = '');
              } else {
                buttonPressed(text2!);
              }
            },
            // ignore: sort_child_properties_last
            child: Text(
              // ignore: unnecessary_string_interpolations
              '$text2',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
        const SizedBox(
          height: 80,
          width: 15,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 50,
          width: 80,
          child: MaterialButton(
            color: Colors.white,

            onPressed: () {
              buttonPressed(text3!);
            },
            // ignore: sort_child_properties_last
            child: Text(
              // ignore: unnecessary_string_interpolations
              '$text3',
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
        const SizedBox(
          height: 80,
          width: 15,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 50,
          width: 80,
          child: MaterialButton(
            color: Colors.white,
            onPressed: () {
              if (text4 == "=") {
                setState(() {
                  onEqualPressed();
                });
              } else {
                buttonPressed(text4!);
              }
            },
            // ignore: sort_child_properties_last
            child: Text(
              '$text4',
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // Container(
            //   height: 160,
            //   color: Colors.amber,
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //child:
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.34,
                  width: MediaQuery.of(context).size.width * 1.99,
                  color: Colors.white,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 88, horizontal: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            question,
                            style: const TextStyle(
                                fontSize: 20.0, color: Colors.blueGrey),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            answer,
                            style: const TextStyle(
                                fontSize: 40.0, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.all(24.0),
                  //   child: Align(
                  //       alignment: Alignment.bottomRight,
                  //       child: Text(
                  //         answer,
                  //         style: const TextStyle(
                  //             fontSize: 40.0, color: Colors.white),
                  //       )),
                  // ),
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Text(
                //     answer,
                //     style: const TextStyle(fontSize: 40.0, color: Colors.black),
                //   ),
                // ),
                // )
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                buildButton(text1: 'AC', text2: 'CE', text3: '%', text4: '/'),
                buildButton(text1: '7', text2: '8', text3: '9', text4: 'x'),
                buildButton(text1: '4', text2: '5', text3: '6', text4: '-'),
                buildButton(text1: '1', text2: '2', text3: '3', text4: ' +'),
                buildButton(text1: '0', text2: '00', text3: '.', text4: '='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
