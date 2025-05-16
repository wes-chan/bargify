import 'package:flutter/material.dart';


class Deals extends StatefulWidget{
  const Deals({super.key});

  @override
  State<Deals> createState() => _Deals();
}

class _Deals extends State<Deals>{
  @override
  Widget build(BuildContext context){
    return Center(
      

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Deals"),
          ],
        ),
        
        
    

    );
  }


}