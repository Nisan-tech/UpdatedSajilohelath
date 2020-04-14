
import 'package:flutter/material.dart';
import 'package:sajilohealth/Services/auth.dart';
import 'package:sajilohealth/Splash_screen.dart';
import 'package:provider/provider.dart';


void main()=>runApp(MyApp());
 
 class MyApp extends StatelessWidget{
   @override 
   Widget build(BuildContext context){
     return StreamProvider.value(
       value:AuthService().user,
            child: MaterialApp(
         home: SplashScreen(),
       ),
     );
   }
 }