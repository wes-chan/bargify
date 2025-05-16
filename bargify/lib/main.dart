import 'package:bargify/constants.dart';
import 'package:bargify/widgets/main_widget.dart';
import 'package:flutter/material.dart';




void main(){

  
  runApp(MyApp());
    


}

class MyApp extends StatelessWidget{
  const MyApp({super.key});



@override
  Widget build(BuildContext context){
  return MaterialApp(
    title: 'Bargify',
    theme: ThemeData().copyWith(
      
      scaffoldBackgroundColor: bgColor,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
      ),
      
    ),
  

      home: const NavKey(),
    );
}

}