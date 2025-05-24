import 'package:bargify/constants.dart';
import 'package:bargify/models/dealmodels.dart';
import 'package:flutter/material.dart';

  class DealExpanded extends StatelessWidget{

  final Deal deal;
    
  const DealExpanded({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {

      return Scaffold(

      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: primaryColor,
        title: const Text('Info',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,


        ),
        ),
        
      ),


       body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(16),
          elevation: 4,
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Center(
                  child: Text(deal.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),

                 


                ),
                 SizedBox(height: 20),
                 Text("Store Name:", style: TextStyle(fontWeight: FontWeight.bold)),
                 Text(deal.storeName),
                 SizedBox(height: 8),
                 Text("Location:", style: TextStyle(fontWeight: FontWeight.bold)),
                 Text(deal.location),
                 SizedBox(height: 8),
                 Text("Category:", style: TextStyle(fontWeight: FontWeight.bold)),
                 Text(deal.category),
                 SizedBox(height: 8),
                 Text("Price:", style: TextStyle(fontWeight: FontWeight.bold)),
                 Text("\$${deal.price.toStringAsFixed(2)}"),
                 SizedBox(height: 8),
                 Text("Start Date:", style: TextStyle(fontWeight: FontWeight.bold)),
                 Text(deal.formatDate(deal.start)),
                 SizedBox(height: 8),
                 Text("End Date:", style: TextStyle(fontWeight: FontWeight.bold)),
                 Text(deal.formatDate(deal.end)),
                 SizedBox(height: 8),

                 const Divider(),
                 SizedBox(height: 8),
                 Text("Description:", style: TextStyle( fontWeight: FontWeight.bold)),
                 Text(deal.description),
                 SizedBox(height: 8),
                  const Divider(),
                  SizedBox(height: 8),
       
                
                if (deal.imageURL != '') Image.network(deal.imageURL!)
                 
                 

              ]
              
            )
          )



        ),
   
            
       
          
          ),
        );
   

         
        
        
         
         
  
            
         
       
        
    

    

  }
    

    
  }