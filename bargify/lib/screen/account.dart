import 'package:bargify/constants.dart';
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
            color: cardColor,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                    'Hi, Guest',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

                  ),
                  ),
              
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                  ElevatedButton.icon(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: bgColor,
                      

                    ),
                    icon: Icon(Icons.login, color: bgColor),
                    label: Text("Log in", style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  
                  ),
                     ElevatedButton.icon(
                      onPressed: () {  },
                       style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: bgColor,

                    ),
                      icon: Icon(Icons.settings, color: bgColor, ),
                      
                      label: Text("Settings", style: TextStyle(
                        fontWeight: FontWeight.bold,

                      )) ,
                     
                     ),
                 ]
                  
                  )


                ]


              )

             )

             
        ),

        SizedBox(height: 10),

        Card(
          color: cardColor,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              
           
          ),
           elevation: 4,
           
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Watch List", style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                
                ),
                
                
                ),
              ),

          
              SizedBox(
                height: 300,

              )





            ],

          )
        )
      ]

      )
    );
  }
    

  }


