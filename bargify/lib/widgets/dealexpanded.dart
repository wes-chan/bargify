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
                 Text(deal.storeName),
                 Text(deal.location),
                 Text(deal.category),
                 Text("\$${deal.price.toStringAsFixed(2)}"),
                 Text(deal.formatDate(deal.start)),
                 Text(deal.formatDate(deal.end)),

                 const Divider(),
                 Text("Description", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                 Text(deal.description),
                  const Divider(),
       
                if (deal.imageURL != '') Image.network(deal.imageURL!)
                 
                 

              ]
              
            )
          )



        ),
   
            
       
          
          ),
        );
   

         
        
        
         
         
  
            
         
       
        
    

    

  }
    

    
  }