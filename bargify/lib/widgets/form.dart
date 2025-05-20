import 'package:bargify/constants.dart';
import 'package:flutter/material.dart';

class Forms extends StatelessWidget {
  const Forms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: primaryColor,
        title: const Text('Submit Deal',
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
