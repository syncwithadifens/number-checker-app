import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_checker/theme/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number = 5;
  int check = 0;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreyColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 140, 30, 60),
              child: Text(
                'Prime number checker',
                style: title,
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 20),
                      child: Text(
                        'Number:',
                        style: subtitle,
                      ),
                    ),
                    Text(
                      '$number',
                      style: subtitle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: (isPressed == false)
                          ? Text(
                              'Click check button first ❗',
                              style: subtitle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : (check == 1)
                              ? Text(
                                  '$number is prime number 🙆‍♂️',
                                  style: subtitle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  '$number is not prime number 🙅',
                                  style: subtitle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          checker();
        },
        label: const Text('Check'),
        icon: const Icon(Icons.fact_check),
        backgroundColor: darkGreyColor,
      ),
    );
  }

  checker() {
    setState(() {
      isPressed = !isPressed;
      isPressed == false ? number = Random().nextInt(100) : '';
      check >= 1 ? check = 0 : '';
      for (var i = 2; i <= number; i++) {
        if (number % i == 0) {
          check++;
        }
        // print(check);
      }
    });
  }
}
