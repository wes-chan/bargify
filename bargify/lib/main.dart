import 'package:flutter/material.dart';
import 'package:bargify/screen/deals.dart';

import 'package:bargify/widgets/navkey.dart';

var myLightColor = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255,27,154,170));

const primaryColor = Color(0xFFF8FFE5);
const secondaryColor = Color(0xFF1B9AAA);
const accentColor = Color(0xFF06D6A0);

void main(){

  
  runApp(MyApp());
    


}

class MyApp extends StatelessWidget{


@override
  Widget build(BuildContext context){
  return MaterialApp(
    title: 'Bargify',
    theme: ThemeData().copyWith(
      colorScheme: myLightColor,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
      ),
    ),
  

      home: Deals(),
    );
}

}