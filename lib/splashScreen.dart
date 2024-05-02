import 'dart:async';

import 'package:flutter/material.dart';


import 'homescreen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    print("codee id her");

    Timer? _timer;


    super.initState();

    // MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);



    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset("assets/splashimg.jpg")),

    );
  }
}