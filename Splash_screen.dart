import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sajilohealth/views/wrapper.dart';

//import 'app.dart';


//create a  new class with a return as provider and auth:AuthService();

class SplashScreen extends StatefulWidget{
   @override
  _SplashScreenState createState()=>_SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  @override 
  Widget build(BuildContext context){
  return MaterialApp(
    
    home: Scaffold(
    
      body:CustomSplash(
           imagePath: 'assets/images/splash.png',
           //backGroundColor: Colors.teal[100],
           ///////////////////////// change the functiom into a login or signup page
           ///
           home: Wrapper(),//change to a seperate code background
           animationEffect: 'zoom-in',
           duration: 2500,
           type: CustomSplashType.StaticDuration,//Static duration is kept because we have no background process currently
      //after connection with the database a function should be used and the type should be changed to Background Process.
      //type 
        
      ),
    )
  );  
 }
}
