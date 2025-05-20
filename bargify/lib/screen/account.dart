import 'package:bargify/constants.dart';
import 'package:bargify/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Account extends StatefulWidget{
  const Account ({super.key});

  @override
  State<Account> createState() => _Account();
}

class _Account extends State<Account>{

     final FirebaseAuth _auth = FirebaseAuth.instance;

     Future<void> _signOut() async {
      await _auth.signOut();
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Signed out successfully!',style:TextStyle(color: bgColor)),
        duration: Duration(seconds: 1),
        backgroundColor: primaryColor,
            
      )
     
          
      );

   }

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
                  
                  StreamBuilder<User?>(
                    stream: _auth.authStateChanges(),
                    builder: (context, snapshot) {
                      final user = snapshot.data;
                      if (user == null){
                      return ElevatedButton.icon(

                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: bgColor,
                          
                      
                        ),
                        icon: Icon(Icons.login, color: bgColor),
                        label: Text("Log In", style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      
                      );
                    } else {

                      return ElevatedButton.icon(

                        onPressed: _signOut,
                            
                       
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: bgColor,
                          
                      
                        ),
                        icon: Icon(Icons.logout, color: bgColor),
                        label: Text("Log out", style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      
                      );
                      
                    }
                
                    }
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
                height: 275,
                child: ListView(

                  
                )

              )





            ],

          )
        )
      ]

      )
    );
  }
    

  }


