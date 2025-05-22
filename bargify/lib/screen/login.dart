import 'package:bargify/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget{

  final FirebaseAuth auth;


  
Login({super.key, FirebaseAuth? auth}):

auth = auth ?? FirebaseAuth.instance;
  

  @override
  State<Login> createState() => _LoginState();

  
}

class _LoginState extends State<Login> {

  

  final _loginEmailController = TextEditingController();
  final _loginPasswordController = TextEditingController();
  
  final _registerEmailController = TextEditingController();
  final _registerPasswordController = TextEditingController();
  final _registerConfirmPasswordController = TextEditingController();

@override
  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    _registerConfirmPasswordController.dispose();
    super.dispose();
  }

  bool isLogin = true;

  bool loginSuccess = false;


  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
    
        appBar: AppBar(
           title: Text(isLogin ? 'Log In' : 'Register',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,


        ),
           ),
        
        backgroundColor: bgColor,
        foregroundColor: primaryColor,
      
        
      ),
     
        body: Center(
             
       
    
          
          child: Card(
            
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            color: cardColor,
             margin: const EdgeInsets.only(left: 24, right: 24, bottom: kToolbarHeight+16),
             
         
            child: Padding(
              
              padding: const EdgeInsets.only(top: 24, bottom: 32,),
              child: isLogin ? _loginPage() : _registerPage(),
            )
          ),
        ),
      

     
    
    );
  }

  Widget _loginPage(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: [
      
         const Text("Welcome back!", style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
      
          ),
      
          
      
      
          ),
      
          const SizedBox(height: 24),
      
            TextField(
              controller: _loginEmailController ,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            
             const SizedBox(height: 16),
          
      
           TextField(
              controller: _loginPasswordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
          
            
            ),
      
      
            const SizedBox(height: 32),
          
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                         
                  onPressed:handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: bgColor,
                     minimumSize: const Size.fromHeight(50)
                  ),
                  
                  child: Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ),
            
             const SizedBox(height: 24),
      
            TextButton(
              onPressed: () => setState(() => isLogin = false),
              
           child: Text("New User? Sign up", style: TextStyle(
            fontWeight: FontWeight.bold,
      
           ),),
            
            ),
      
            
      
      
      
      
      
      
      
        ],
      
      
      
      ),
    );



    
  }
Widget _registerPage(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        
        children: [
      
         const Text("Join us now!", style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
      
          ),
      
          
      
      
          ),
      
          const SizedBox(height: 24),
      
            TextField(
              controller: _registerEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            
             const SizedBox(height: 16),
          
      
           TextField(
              controller: _registerPasswordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
          
            
            ),

             const SizedBox(height: 16),

              TextField(
              controller: _registerConfirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(labelText: "Confirm Password"),
              obscureText: true,
          
            
            ),
      
      
            const SizedBox(height: 32),
          
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                         
                  onPressed:handleRegister,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: bgColor,
                     minimumSize: const Size.fromHeight(50)
                  ),
                  
                  child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ),
              ),
            
             const SizedBox(height: 24),
      
            TextButton(
              onPressed: () => setState(() => isLogin = true),
              
           child: Text("Already have an account? Sign in", style: TextStyle(
            fontWeight: FontWeight.bold,
      
           ),),
            
            ),
      
            
      
      
      
      
      
      
      
        ],
      
      
      
      ),
    );


  


    
  }


    Future<void> handleLogin() async {
      final email = _loginEmailController.text;
      final password = _loginPasswordController.text;

   
      print('Login attempt with: $email');


      try {
        final crediental = await widget.auth.signInWithEmailAndPassword(email: email, password: password);

        loginSuccess = true;
        print(crediental);

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Logged in successfully!',style:TextStyle(color: bgColor)),
            duration: Duration(seconds: 2),
            backgroundColor: primaryColor,
          )
          
          
          );
     Navigator.of(context).pop();


      } on FirebaseAuthException catch(e){

       String message = "Login failed.";

        if (e.code == 'user-not-found'){
          message = 'No user found for that email';
        } else if (e.code == 'wrong-password'){
          message = 'The password you entered is incorrect';
        }

          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
                    content: Text(message, style:TextStyle(color: bgColor),),
            duration: Duration(seconds: 1),
            backgroundColor: primaryColor,
          )
          
          
          );
        
      }




      }

Future<void> handleRegister() async{
  final email = _registerEmailController.text;
  final password = _registerPasswordController.text;
  final confirmPassword = _registerConfirmPasswordController.text;

  if (password != confirmPassword){
     ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Passwords do not match",style:TextStyle(color: bgColor)),
            duration: Duration(seconds: 1),
            backgroundColor: primaryColor,
          )
     );

     return;

  }

  print('Registration attempt with: $email');

  try {
    final credential = await widget.auth.createUserWithEmailAndPassword(
      email: email, password: password);

      loginSuccess = true;
      print(credential);
      

      if (!mounted) return;
      Navigator.of(context).pop();
  
     ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account created successfully!',style:TextStyle(color: bgColor)),
            duration: Duration(seconds: 1),
            backgroundColor: primaryColor,
            
          )
          
          
          );

} on FirebaseAuthException catch(e){
   String message = 'Registration failed.';

  if (e.code == 'weak-password'){
    message = "The password provided is too weak.";
  } else if (e.code == 'email-already-in-use'){
    message = "The account already exists for that email";
  }
  ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Text(message, style:TextStyle(color: bgColor),),
            duration: Duration(seconds: 1),
            backgroundColor: primaryColor,
            
            
          )
          
          
          );
  



}



}

    






  
}