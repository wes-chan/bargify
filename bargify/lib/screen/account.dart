import 'package:bargify/constants.dart';
import 'package:bargify/widgets/login.dart';
import 'package:bargify/state/watchlist_state.dart';
import 'package:bargify/widgets/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


class Account extends StatefulWidget{
    final FirebaseAuth? auth;
  const Account ({super.key, this.auth});

  @override
  State<Account> createState() => _Account();
}

class _Account extends State<Account>{


  FirebaseAuth get _auth => widget.auth ?? FirebaseAuth.instance;
   

     Future<void> _signOut() async {
      await _auth.signOut();

       if (!mounted) return;
      // Stars needs to be cleared after logging out, to avoid stars appeared from previous session
      final watchListState = Provider.of<WatchListState>(context, listen: false);
      watchListState.clear();

      
    

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
        
        // The account widget that displays the profile, log out button and settings
        Card(
          margin: EdgeInsets.all(16),
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
                  // The profile picture avatar 
                  CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                      

                    )
                   
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                    'Hello!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

                  ),
                  ),
              
                  Row (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                
                 // Show logout if users logged in. Show login if users logged out.
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
                      onPressed: () { 


                        ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                              content: Text("This feature is unavailable at the moment", style:TextStyle(color: bgColor),),
                              duration: Duration(seconds: 1),
                              backgroundColor: primaryColor,
                            )
                            );
                       },
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

      // The main widget to access to Watch List

      Card(
              elevation: 4,
               margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8 ),
               color: cardColor,
                child: ListTile(
                  
                       leading: Icon(Icons.bookmark_border, color: primaryColor),
              
        
                        
                       title: Text("Watch List",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
        
                       ),),

                       subtitle: Text("Your watch list"),
                       

                       trailing: Icon(Icons.arrow_forward_ios),
                       onTap: () {


                        // Disable access to Watch List if user is not logged in
                        if (_auth.currentUser == null){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                              content: Text("Please sign in to use Watch List", style:TextStyle(color: bgColor),),
                              duration: Duration(seconds: 1),
                              backgroundColor: primaryColor,
                            )
                            );

                        } else {
                       
                         Navigator.push(context, MaterialPageRoute(builder: (context) => WatchList()));
                        }
                        
                       }
                      ),
              
        
        
            )

            

        ]
      




      
      

      )
    );
  }
    

  }


