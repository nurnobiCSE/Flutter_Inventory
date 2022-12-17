import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


var url = "https://nurnobi.pythonanywhere.com/api/productadd/";
var userurl = "https://nurnobi.pythonanywhere.com/api/registered_user/";
var returnurl = "https://nurnobi.pythonanywhere.com/api/returnproduct/";
var loginurl = "https://nurnobi.pythonanywhere.com/api/login/";
var saleurl = "https://nurnobi.pythonanywhere.com/api/saleproduct/";

var stringResponse;
var stringuserResponse;
var returnResponse;
var loginResponse;
var salesResponse;
List data = [];
List userdata = [];
List returndata = [];
List logindata = [];
List saledata = [];
var data_loading = false;

Future productAddApiCall()async{
  data_loading = false;
  try{
    http.Response response;
    response = await http.get(Uri.parse(url));
    stringResponse = response.body;
    var toJson = json.decode(response.body);
    data = toJson;
    data_loading=false;
  }catch(e){data_loading=true;}

  }

Future userApiCall()async{
  http.Response response;
  response = await http.get(Uri.parse(userurl));
  if(response.statusCode ==200){
    stringuserResponse = response.body;
    var toJson = json.decode(response.body);
    userdata = toJson;
    print("................,,,,,,,,,,,,,,");
    print(userdata);
  }
}
Future loginApiCall()async{
  http.Response response;
  response = await http.get(Uri.parse(loginurl));
  if(response.statusCode ==200){
    loginResponse = response.body;
    var toJson = json.decode(loginResponse);
    logindata = toJson;
    print("................,:::::::::::::::::::::::::::,,,,,,,,,,,,,");

    print(logindata);
  }
}

Future returnApiCall()async{
  http.Response response;
  response = await http.get(Uri.parse(returnurl));
  if(response.statusCode ==200){
    returnResponse = response.body;
    var toJson = json.decode(response.body);
    returndata = toJson;
    print("................,,,,,,,,,,,,,,");
    print(returndata);
  }
}
Future saleApiCall()async{
  http.Response response;
  response = await http.get(Uri.parse(saleurl));
  if(response.statusCode ==200){
    salesResponse = response.body;
    var toJson = json.decode(response.body);
    saledata = toJson;
    print("................,,,,,,,,,,,,,,");
    print(saledata);
  }
}


