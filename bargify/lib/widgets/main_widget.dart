
import 'package:bargify/constants.dart';
import 'package:bargify/screen/account.dart';
import 'package:bargify/screen/deals.dart';
import 'package:bargify/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavKey extends StatefulWidget{
  const NavKey({super.key});

  @override
  State<NavKey> createState() => _NavKey();


}

void _showForm(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const Forms()
      
      
      )
  );
}




class _NavKey extends State<NavKey>{

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Deals(),
    Forms(),
    Account(),
  ];

  

void _onItemTapped(int index){
  if (index == 1){
    final user = FirebaseAuth.instance.currentUser;
    if (user == null){

      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('You must be logged in to use this feature.',style:TextStyle(color: bgColor)),
        duration: Duration(seconds: 1),
        backgroundColor: primaryColor,
            
      )
     
      );

    } else {
    _showForm(context);
    }
  } else {
  setState((){
    _selectedIndex = index;
  });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold (

      appBar: AppBar(
        title: const Text("Bargify",
          style:TextStyle(
            fontWeight: FontWeight.bold,
            
            fontSize: 32,
          )
        
        ),

        
      ),
    
    body: _pages[_selectedIndex],

    bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
      selectedFontSize: 14,
       unselectedFontSize: 12,
       type: BottomNavigationBarType.fixed,
       selectedItemColor: primaryColor,
       unselectedItemColor: textColor,

   backgroundColor: Color(0xFFFFFFFF),
   

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Sales',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Submit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),




        ]

    )

      );




    
  }
  

  
}