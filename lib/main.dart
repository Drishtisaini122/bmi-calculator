// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'calculation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://photographylife.com/wp-content/uploads/2021/05/Texture-of-rough-water.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: AvatarGlow(
                    endRadius: 150,
                    shape: BoxShape.circle,
                    glowColor: Colors.white,
                    duration: Duration(seconds: 3),
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    showTwoGlows: true,
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Body.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Body Mass Index Calculator",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => BMIPage()));
                      },
                      child: Text(
                        "Calculate BMI",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.all(15),
                      )),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
