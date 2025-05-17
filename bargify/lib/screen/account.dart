import 'package:flutter/material.dart';


class Account extends StatefulWidget{
  const Account ({super.key});

  @override
  State<Account> createState() => _Account();
}

class _Account extends State<Account>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
      children:[
        
        
        Card(
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
             ),

             elevation: 4,
             child: Padding(

              padding: EdgeInsets.all(16),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Hi, Guest',
                    style: TextStyle(fontSize: 18),
                  ),


                ]


              )

             )

             
        ),

        SizedBox(height: 20),

        Card(

              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              
           
          ),
           elevation: 4,
           
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Text("Watch List", style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,

              ),),
            ],

          )
        )
      ]

      )
    );
  }
    

  }


