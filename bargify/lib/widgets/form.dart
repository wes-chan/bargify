import 'package:bargify/constants.dart';
import 'package:bargify/models/dealmodels.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

   @override
     State<Forms> createState() => _Forms();

}


  
class _Forms extends State<Forms> {

// Controllers
final _startController = TextEditingController();
final _endController = TextEditingController();


DateTime? _startDate; 
DateTime? _endDate; 

    Future<void> _openStartPicker() async{
      
     final selectedDate = await pickDate(context, DateTime.now(), DateTime(2025), DateTime(2100));
      
     if (selectedDate != null) {
      setState((){
        _startDate = selectedDate;
        _startController.text = _startDate.toString().split(' ')[0];
        

      });
     }
    }

    Future<void> _openEndPicker() async{
     final selectedDate = await pickDate(context, _startDate ?? DateTime.now(), _startDate ?? DateTime(2025), DateTime(2100));
     if (selectedDate != null) {
      setState((){
        _endDate = selectedDate;
        _endController.text = _endDate.toString().split(' ')[0];
        

      });
     }
    }



  // Start 


  @override

  Widget build(BuildContext context) {

      return Scaffold(

      appBar: AppBar(
        backgroundColor: bgColor,
        foregroundColor: primaryColor,
        title: const Text('Submission',
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
                  child: Text("Submit a new deal!", style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),)
                  
                ),
                 const SizedBox(height: 10),
                
                  Column(
                    children: [
                    TextField( decoration: const InputDecoration(
                          labelText: 'Title',
                         )),

                    SizedBox(height: 10),
                    Row(
                      
                      children: [
                        Expanded(
                      child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Category',
                          ),
                          items: CategoryModel.categoryOptions.map((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );

                          }).toList(),

                          onChanged: (String? category){
                            print('Selected:');
                          }
                          ),
                        ),

                        SizedBox(width: 30,),

                          Expanded(
                          child: TextField( 
                            decoration: const InputDecoration(
                             labelText: 'Price',
                             prefixText: '\$',
                         
                         ),
                          keyboardType: TextInputType.numberWithOptions(decimal: true),

                         ),
                          ),

                      ],

                     
                      

                    ),

                    SizedBox(height: 10),
                    

                    TextField( decoration: const InputDecoration(
                          labelText: 'Store Name',
                         )),
                    
                     TextField( decoration: const InputDecoration(
                          labelText: 'Location',
                         )),

                     SizedBox(height: 10),

                     Row(
                      children: [

                        Expanded(

                        child: TextField(
                          controller: _startController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Start',
                         
                          

                          ),
                          onTap: _openStartPicker,
                        ),
                        ),

                        SizedBox(width: 30),

                        Expanded(

                        child: TextField(
                          controller: _endController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'End',
                            enabled: _startDate != null,
                       
                          

                          ),
                          onTap: _openEndPicker,
                        ),
                        ),

                      

                        

                      ],
                     



                      
                      
                     ),







                     TextField( decoration: const InputDecoration(
        
                          labelText: 'Description',
                          
                         )),

                  SizedBox(height: 30),

                 SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                         
                  onPressed:(){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: bgColor,
                     minimumSize: const Size.fromHeight(50)
                  ),
                  
                  child: Text("Submit", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ),

                    

                    ],




                  )




                

              ]
              
            )
          )



        ),
   
            
       
          
          ),
        );
   

         
        
        
         
         
  
            
         
       
        
    

    

  }
  

      



    
}

Future<DateTime?> pickDate(BuildContext context, DateTime initialDate, DateTime firstDate, DateTime lastDate){

return showDatePicker(
  context: context,
  initialDate: initialDate,
  firstDate: firstDate,
  lastDate: lastDate,
);
}