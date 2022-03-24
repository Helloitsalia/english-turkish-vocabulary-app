
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kelime_app/pages/homePage.dart';

class TemproryPage extends StatefulWidget {
  const TemproryPage({Key? key}) : super(key: key);

  @override
  State<TemproryPage> createState() => _TemproryPageState();
}

class _TemproryPageState extends State<TemproryPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/logo.png"),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "DENEME",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "mine",
                            fontSize: 30),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "deneme",
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "caviar",
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
