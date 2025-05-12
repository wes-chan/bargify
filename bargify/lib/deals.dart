import 'package:flutter/material.dart';


/* Color Scheme
F8FFE5 - Primary
1B9AAA - Secondary
06D6A0 - Accent

*/

class Deals extends StatefulWidget{
  
  State<Deals> createState(){
    return _Deals();
  }
}

class _Deals extends State<Deals>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
        title: const Text("Bargify",
          style:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          )
        
        ),
          

        
        backgroundColor: Color(0xFF1B9AAA),
        elevation: 20, // Optional: shadow effect
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Deals"),
          ],
        ),
      ),



    );
  }


}