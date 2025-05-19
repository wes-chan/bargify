import 'package:bargify/constants.dart';
import 'package:flutter/material.dart';


class Deals extends StatefulWidget{
  const Deals({super.key});

  @override
  State<Deals> createState() => _Deals();
}

class _Deals extends State<Deals>{
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {

        return Card(
          elevation: 4,
           margin: const EdgeInsets.all(8),
           color: cardColor,
            child: ListTile(
                  //Placeholders 
                   leading: Icon(Icons.local_offer, color: primaryColor,), // Category or Image?
                   title: Text("Placeholder",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                   ),), // Name
                   subtitle: Padding(
                     padding: const EdgeInsets.only(top: 8),
                     child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shop Name "), // Location
                            Text("Price: \$100.00"), // Price
                            Text("Ends: 00 Days"), // Time
                                       
                                       
                     
                          ],
                     
                      
                     
                     
                     
                     ),
                   ),
                   trailing: Icon(Icons.arrow_forward_ios),
                   onTap: () {

                   }
                  ),
          


        );
        
        },

    );
  }


}