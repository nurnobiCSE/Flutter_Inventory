import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


var url = "https://nurnobi.pythonanywhere.com/api/productadd/";
var userurl = "https://nurnobi.pythonanywhere.com/api/registered_user/";
var returnurl = "https://nurnobi.pythonanywhere.com/api/returnproduct/";
var stringResponse;
var stringuserResponse;
var returnResponse;
List data = [];
List userdata = [];
List returndata = [];
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


