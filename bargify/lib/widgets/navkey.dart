
import 'package:flutter/material.dart';

class NavKey extends StatefulWidget{
  const NavKey({super.key});

  @override
  State<NavKey> createState() => _NavKey();


}



class _NavKey extends State<NavKey>{

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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



      );




    
  }
  

  
}