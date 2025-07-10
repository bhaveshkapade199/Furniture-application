import 'dart:async';

import 'package:flutter/material.dart';

import 'package:furniture_app/wrapper.dart';

class Splash extends StatefulWidget {
  final int index;
  const Splash({super.key, required this.index});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Wrapper()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/furniture1.jpg"),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 134, 134, 134),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
