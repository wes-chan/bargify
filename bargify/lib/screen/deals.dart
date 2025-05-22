import 'package:bargify/constants.dart';
import 'package:bargify/widgets/dealexpanded.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bargify/models/dealmodels.dart';




class Deals extends StatefulWidget{
  const Deals({super.key});

  @override
  State<Deals> createState() => _Deals();
}

class _Deals extends State<Deals>{



  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream:  FirebaseFirestore.instance.collection('deals').snapshots(),
      builder: (context, snapshot) {

       if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
   }

  if (snapshot.hasError) {
    return Center(child: Text("Error: Failed to connect"));
  }

  // Check if snapshot has data before using it
  if (!snapshot.hasData || snapshot.data == null || snapshot.data!.docs.isEmpty) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          color: cardColor,
            child: Text("No deals are currently available.", style: TextStyle(color: primaryColor),)
           
            ),
            
      )

    );
      
  }




      // Access the database of deals
        final deals = snapshot.data!.docs.map((doc){
         
              final data = doc.data() as Map<String, dynamic>;
              return Deal.fromFirestore(doc.id, data);
            }).toList();
        
        return ListView.builder(
          itemCount: deals.length,
          itemBuilder: (BuildContext context, int index) {
            final deal = deals[index];


            // Main Widgets 
            return Card(
              elevation: 4,
               margin: const EdgeInsets.all(8),
               color: cardColor,
                child: ListTile(
                      //Placeholders 
                       leading: IconButton(
                        
                        onPressed: () async{
                          final user = FirebaseAuth.instance.currentUser;
                          final messenger = ScaffoldMessenger.of(context); 
                          if (user == null){
                             messenger.showSnackBar(
                              SnackBar(
                              content: Text("Please sign in to save this deal", style:TextStyle(color: bgColor),),
                              duration: Duration(seconds: 1),
                              backgroundColor: primaryColor,
                            )
                            
                        );
                        return;
                          }

                          final data = FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid)
                          .collection('watchlist')
                          .doc(deal.id);

                          await data.set({
                            'name': deal.name,
                          'Description': deal.description,
                          'storeName': deal.storeName,
                          'Location': deal.location,
                          'category': deal.category,
                          'Price': deal.price,
                          'Start': deal.start,
                          'End': deal.end,
         
                            




                          });

                 
                            messenger.showSnackBar(
                              SnackBar(
                              content: Text("Deal has been saved", style:TextStyle(color: bgColor),),
                              duration: Duration(seconds: 1),
                              backgroundColor: primaryColor,
                            )
                            );





                        },
        
                       icon: Icon(
                        Icons.star_border_rounded, 
                        color: primaryColor, 
                        size: 30,
                       ),
                       ),
                       
        
                        // Category or Image?
                       title: Text(deal.name,style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
        
                       ),), // Name
                       subtitle: Padding(
                         padding: const EdgeInsets.only(top: 5),
                         child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(deal.storeName, style: TextStyle( fontWeight: FontWeight.bold,),), // Location
                                Text("Price: \$${deal.price.toStringAsFixed(2)}"), // Price
                                Text("Starts: ${deal.formatDate(deal.start)}"), // Time
                                Text("Ends: ${deal.formatDate(deal.end)}"), // Time
                                           
                                           
                         
                              ],
                         
                          
                         
                         
                         
                         ),
                       ),
                       trailing: Icon(Icons.arrow_forward_ios),
                       onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DealExpanded(deal: deal)),
                          );
                       }
                      ),
              
        
        
            );
            
            },
        
        );
      }
    );
  }


}