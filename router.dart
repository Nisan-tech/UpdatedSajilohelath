import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:sajilohealth/main.dart';
import 'package:sajilohealth/views/home_screens/EPharmView.dart';

class Router{
 static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      //case'/':
      //return MaterialPageRoute(builder: (_)=>MyApp());
      case '/secondRoute':
        return MaterialPageRoute(builder: (_)=>EPharmView());
      default:
        return MaterialPageRoute(builder: (_)=>Scaffold(body:Center(child:null ,)));

    }
  }
}