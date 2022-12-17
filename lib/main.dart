import 'dart:async';
import 'dart:io';
import 'package:chat/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat/home_screen.dart';
import 'package:chat/all_api.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:chat/all_api.dart';

//https://nurnobi.pythonanywhere.com/api/registered_user/

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  );
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
        home: SplashScreen(),
        // LoginPage(),
        theme: ThemeData(scaffoldBackgroundColor:  const Color(0xFFEFEFEF),primarySwatch: Colors.deepOrange),
    );
  }
}
class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState()=> _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isLoading = false;

  //code for internet checking :
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;
  @override
  void initState(){
    getConnectivity();
    super.initState();
  }
  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
            (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );
  @override
  void dispose(){
    subscription.cancel();
    super.dispose();
  }

  //End code for internet checking :
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // productAddApiCall();
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
              Stack(
                alignment: Alignment.center,
                children: [
                Column(
                  children: [
                    Text("\nLogin To IMS\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height /1.3,
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
                              controller: _username,
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
                              controller: _password,
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
                              isLoading = true;
                              bool isMatched = false;
                              // login(_username.text.toString(),_password.text.toString());
                              loginApiCall();
                              for(int i =0; i < logindata.length; i++){
                                var uname = logindata[i]['username'].toString();
                                var pass = logindata[i]['password1'].toString();
                                if(uname == _username.text.toString() && pass == _password.text.toString()){
                                  isLoading = false;
                                  isMatched = true;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Loged In Successful!",style: TextStyle(color: Colors.green)),
                                        duration: Duration(seconds: 2),
                                        action: SnackBarAction(
                                          label: "Undo",
                                          textColor: Colors.white,
                                          onPressed: (){
                                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                          },
                                        ),
                                      )
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomePage())
                                  );
                                   print(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::ok");
                                   break;
                                }

                              }
                              if(!isMatched){
                                isLoading = false;
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("username password incorrect!",style: TextStyle(color: Colors.red)),
                                      duration: Duration(seconds: 2),
                                      action: SnackBarAction(
                                        label: "Undo",
                                        textColor: Colors.white,
                                        onPressed: (){
                                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                        },
                                      ),
                                    )
                                );
                                print(":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::Not ok");
                              }
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
                          TextButton(onPressed: ()=> exit(0), child: Text("ToExit-->")),
                          Padding(
                            padding: EdgeInsets.only(bottom: 0.0,top: 1.0),
                            child: Container(
                              height: 200,
                              // color: Colors.blueAccent,
                              child: Center(
                                child: Image.asset("assets/home_logo-removebg-preview.png",),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                  isLoading?CircularProgressIndicator(

                  ):Container()
          ]
              ),
            ],
          ),
        ),
      ),
    );
  }
  showDialogBox() => showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('No Connection'),
        content: const Text('Please check your internet connectivity'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.pop(context, 'Cancel');
              setState(() => isAlertSet = false);
              isDeviceConnected =
              await InternetConnectionChecker().hasConnection;
              if (!isDeviceConnected && isAlertSet == false) {
                showDialogBox();
                setState(() => isAlertSet = true);
              }
            },
            child: const Text('OK'),
          ),
        ],
    )
  );
}


