import 'dart:async';

import 'package:chat/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{

  @override
  _SplashScreenState createState()=> _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4),()=> Navigator.pushReplacement(
        context, MaterialPageRoute(builder:  (context)=> LoginPage())));
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange,
              Colors.deepOrange,
              Colors.orange,


            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png',height: 300.0,width: 300.0,),
                Center(
                  child: Text(
                    "Welcome To ",
                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "Inventory Management System",
                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            CircularProgressIndicator(
              backgroundColor: Colors.yellowAccent,
              color: Colors.black87,
            )
          ],
        ),
      ),
    );
  }
}