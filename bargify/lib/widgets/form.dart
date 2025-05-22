import 'package:bargify/constants.dart';
import 'package:bargify/models/dealmodels.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Forms extends StatefulWidget {
  const Forms({super.key});

   @override
     State<Forms> createState() => _Forms();

}


  
class _Forms extends State<Forms> {

// Controllers
final _titleController = TextEditingController();
final _priceController = TextEditingController();
final _storeNameController = TextEditingController();
final _locationController = TextEditingController();
final _descriptionController = TextEditingController();

// For displaying
final _startController = TextEditingController();
final _endController = TextEditingController();


DateTime? _startDate; 
DateTime? _endDate;
String? _selectedCategory;

@override
  void dispose() {
    super.dispose();
  _titleController.dispose();
  _priceController.dispose();
  _storeNameController.dispose();
  _locationController.dispose();
  _descriptionController.dispose();
  _startController.dispose();
  _endController.dispose();

}
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
     final selectedDate = await pickDate(context, DateTime.now(), DateTime.now(), DateTime(2100));
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


       body: Center(
         child: SingleChildScrollView(
          child: Card(
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: kToolbarHeight),
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
                      TextField( 
                        decoration: const InputDecoration(
                            labelText: 'Title',
                           ),
                            controller: _titleController,
                           ),
         
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
         
                            onChanged: (String? value){
                              setState(() {
                              _selectedCategory = value;
                              
                              }
                              );
                            },
                            value: _selectedCategory,
                            ),
                          ),
         
                          SizedBox(width: 30,),
         
                            Expanded(
                            child: TextField( 
                              controller: _priceController,
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
                      
         
                      TextField(
                        controller: _storeNameController,
                         decoration: const InputDecoration(
                       
                            labelText: 'Store Name',
                           )),
                      
                       TextField(
                        controller: _locationController,
                         decoration: const InputDecoration(
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
         
         
         
         
         
         
         
                       TextField( 
                        controller: _descriptionController,
                        decoration: const InputDecoration(
          
                            labelText: 'Description',
                            
                           )),
         
                    SizedBox(height: 30),
         
                   SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                           
                    onPressed:() async {
                      if (double.tryParse(_priceController.text) == null){
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                           content: Text("Please enter a correct price value", style:TextStyle(color: bgColor),),
                           duration: Duration(seconds: 1),
                           backgroundColor: primaryColor,
                           )
                        );
                        
                        return;
                      
                      }
                      
                      if (
                        _titleController.text.isEmpty ||
                        _priceController.text.isEmpty ||
                        _storeNameController.text.isEmpty ||
                        _locationController.text.isEmpty ||
                        _descriptionController.text.isEmpty ||
                        _startDate == null || _endDate == null ||
                        _selectedCategory == null
                         
                        ){
                          ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                           content: Text("Please fill all fields", style:TextStyle(color: bgColor),),
                           duration: Duration(seconds: 1),
                           backgroundColor: primaryColor,
                        )
                          );
                          return;
            
                        }
         
                       final instance = Deal(
                        id: '',
                        name: _titleController.text,
                        description: _descriptionController.text,
                        storeName: _storeNameController.text,
                        location: _locationController.text,
                        category: _selectedCategory!,
                        price: double.parse(_priceController.text),
                        start: _startDate!,
                        end: _endDate!,
                       );
         
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                           content: Text("Deal submitted!", style:TextStyle(color: bgColor),),
                           duration: Duration(seconds: 1),
                           backgroundColor: primaryColor,
                        )
                          );
         
                        final data = FirebaseFirestore.instance.collection('deals').doc();
                        await data.set({
                          'name': instance.name,
                          'Description': instance.description,
                          'storeName': instance.storeName,
                          'Location': instance.location,
                          'category': instance.category,
                          'Price': instance.price,
                          'Start': instance.start,
                          'End': instance.end,
         
                        });

                        setState(() {

                        _titleController.clear();
                        _descriptionController.clear();
                        _storeNameController.clear();
                        _locationController.clear();
                        _priceController.clear();
                        _startController.clear();
                        _endController.clear();
                        _startDate = null;
                        _endDate = null;
                        _selectedCategory = null;



                        });
         
         
         
         
         
         
         
                    },
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