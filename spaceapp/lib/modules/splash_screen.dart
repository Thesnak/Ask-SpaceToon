import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:spaceapp/modules/chat_bot.dart';
import 'package:spaceapp/modules/search_screen.dart';
import '../main.dart';

class SplashScren extends StatefulWidget {
  const SplashScren({Key? key}) : super(key: key);

  @override
  State<SplashScren> createState() => _SplashScrenState();
}

class _SplashScrenState extends State<SplashScren> {
  var _time;
  start(){
    _time = Timer(Duration(seconds: 6),call);
  }
  void call(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context)=>SearchScreen(),),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    start();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _time.cancel;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.black,
          systemNavigationBarColor: Colors.black
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(child: Lottie.network('https://assets8.lottiefiles.com/packages/lf20_rj4titti.json')),
    );
  }
}
