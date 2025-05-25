import 'package:bargify/constants.dart';
import 'package:bargify/state/watchlist_state.dart';
import 'package:bargify/widgets/dealexpanded.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bargify/models/dealmodels.dart';
import 'package:provider/provider.dart';




class Deals extends StatefulWidget{
  final FirebaseFirestore? firestore;

  
  const Deals({super.key, this.firestore});
  @override
  State<Deals> createState() => _Deals();
}

class _Deals extends State<Deals>{
  User? get user => FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context){

  
    return StreamBuilder<QuerySnapshot>(
      stream:  (widget.firestore ?? FirebaseFirestore.instance).collection('deals').snapshots(),
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
              child: Text("No deals are available", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
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
         
            

           return Consumer<WatchListState>(
          builder: (BuildContext context, WatchListState watchListState, Widget? child) { 
            final isInWatchList = watchListState.watchList.contains(deal.id);
          
         

            // Main Widgets 
            return Card(
              elevation: 4,
               margin: const EdgeInsets.all(8),
               color: cardColor,
                child: ListTile(
                    
                       leading: IconButton(
                        
                        onPressed: () async{
                          // Disable users from utilising starring. Starring requires an account to store these listing
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

                          await watchListState.toggleStar(deal);

                    

                 
                            messenger.showSnackBar(
                              SnackBar(
                              content: Text(isInWatchList ? "Deal removed from Watch List" : "Deal has been saved", style:TextStyle(color: bgColor),),
                              duration: Duration(seconds: 1),
                              backgroundColor: primaryColor,
                            )
                            );





                        },
        
                       icon: Icon(
                        isInWatchList ? Icons.star_rounded : Icons.star_border_rounded, 
                        color: primaryColor, 
                        size: 30,
                       ),
                       ),
                       
        
               
                       title: Text(deal.name,style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
        
                       ),), 
                       subtitle: Padding(
                         padding: const EdgeInsets.only(top: 5),
                         child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(deal.storeName, style: TextStyle( fontWeight: FontWeight.bold,),), 
                                Text("Price: \$${deal.price.toStringAsFixed(2)}"), 
                                Text("Starts: ${deal.formatDate(deal.start)}"),
                                Text("Ends: ${deal.formatDate(deal.end)}"),        
                         
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
       
          
          }
           
           );
           
          }
        
        );
      }
    );
  }

}