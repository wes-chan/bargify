import 'package:flutter/material.dart';


class Submit extends StatefulWidget{
  const Submit({super.key});

  @override
  State<Submit> createState() => _Submit();
}

class _Submit extends State<Submit>{
  @override
  Widget build(BuildContext context){
    return Center(
      

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Submit"),
          ],
        ),
        
        
    

    );
  }


}