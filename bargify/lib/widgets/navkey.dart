
import 'package:bargify/constants.dart';
import 'package:bargify/screen/account.dart';
import 'package:bargify/screen/deals.dart';
import 'package:bargify/screen/submit.dart';
import 'package:flutter/material.dart';

class NavKey extends StatefulWidget{
  const NavKey({super.key});

  @override
  State<NavKey> createState() => _NavKey();


}



class _NavKey extends State<NavKey>{

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Deals(),
    Submit(),
    Account(),
  ];

void _onItemTapped(int index){
  setState((){
    _selectedIndex = index;
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold (

      appBar: AppBar(
        title: const Text("Bargify",
          style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
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