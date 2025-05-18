import 'package:bargify/constants.dart';
import 'package:bargify/firebase_options.dart';
import 'package:bargify/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MyApp());
    


}

class MyApp extends StatelessWidget{
  const MyApp({super.key});



@override
  Widget build(BuildContext context){
  return MaterialApp(
    title: 'Bargify',
    theme: ThemeData().copyWith(

      colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondaryColor,
    surface: cardColor,

  ),
      
      scaffoldBackgroundColor: bgColor,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
      ),

      cardColor: cardColor,
      
    ),
  

      home: const NavKey(),
    );
}

}