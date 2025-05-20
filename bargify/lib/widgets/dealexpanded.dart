import 'package:bargify/constants.dart';
import 'package:flutter/material.dart';

  class DealExpanded extends StatelessWidget{
    
  const DealExpanded({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(

      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: secondaryColor,
        title: const Text('Info',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,


        ),
        ),
        
      ),

       body: const Center(child: Text("Hello from the new page!")),
    );

    

  }
    

    
  }