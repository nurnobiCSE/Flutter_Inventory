import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chat/home_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        theme: ThemeData(scaffoldBackgroundColor:  const Color(0xFFEFEFEF)),
    );
  }
}
class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState()=> _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),
              ]
            )
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  Text("\nLogin Page\n",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)
                        )
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height /8,
                          width: MediaQuery.of(context).size.width /1.5,
                          // color: Colors.pink,
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: 'Username',
                                hintText: 'my username'
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: MediaQuery.of(context).size.height /8,
                          width: MediaQuery.of(context).size.width /1.5,
                          // color: Colors.pink,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                hintText: ''
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HomePage())
                            );

                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height /9,
                            width: MediaQuery.of(context).size.width /2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.pink[700],
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(builder: (context) => SignUp_Page())
                                    // );
                                  },
                                  child: Container(
                                    child:Center(
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24
                                        ),
                                      ),
                                    ),
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                              ),
                                )
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    exit(0);
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text("Exit",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24
                                      ),
                                      ),
                                    ),
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                              ),
                                ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


