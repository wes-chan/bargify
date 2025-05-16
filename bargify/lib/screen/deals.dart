import 'package:bargify/constants.dart';
import 'package:bargify/widgets/navkey.dart';
import 'package:flutter/material.dart';


class Deals extends StatefulWidget{
  const Deals({super.key});

  @override
  State<Deals> createState() => _Deals();
}

class _Deals extends State<Deals>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
        title: const Text("Bargify",
          style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          )
        
        ),
          

        
      
        elevation: 20,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Deals"),
          ],
        ),
      ),

      bottomNavigationBar: NavKey(),



    );
  }


}