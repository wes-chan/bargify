import 'package:bargify/constants.dart';
import 'package:bargify/models/dealmodels.dart';
import 'package:bargify/state/watchlist_state.dart';
import 'package:bargify/widgets/dealexpanded.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchList extends StatefulWidget{
  const WatchList({super.key});

  @override
  State<WatchList> createState() => _WatchListState();





}

class _WatchListState extends State<WatchList>{

  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
           title: Text("Watch List",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,


        ),
           ),
        
        backgroundColor: bgColor,
        foregroundColor: primaryColor,
      
        
      ),

      

      
     body: StreamBuilder<QuerySnapshot>(

      
      stream:  FirebaseFirestore.instance.collection('users').doc(user?.uid).collection('watchlist').snapshots(),
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
   
        child: Card(
          color: cardColor,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("No deals saved.", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
            )
            
           
            ),
            
      

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
                         final watchListState = Provider.of<WatchListState>(context, listen: false);
                         await watchListState.removefromWatchList(deal.id);





                        },
        
                       icon: Icon(
                        Icons.star_rounded, 
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

                        Navigator.push(context, MaterialPageRoute(builder: (context) => DealExpanded(deal: deal)));
                       }
                       
                      ),
              
        
        
            );
            
            },
        
        );
      }
    )



    );
  }
}