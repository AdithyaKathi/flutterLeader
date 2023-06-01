import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    final firstNameEditingController = new TextEditingController();
    final lastNameEditingController = new TextEditingController();

    final emailEditingController = new TextEditingController();
    final passwordEditingController = new TextEditingController();
    final confirmPasswordEditingController = new TextEditingController();


//First Name Is Here
    final firstNameField = TextFormField(
      autofocus:false,
      controller:firstNameEditingController,
      keyboardType: TextInputType.name,
      //validator: (){},
      onSaved: (value){
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.contact_mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        )
      ),
    );

    // Last Name Is Here
    final lastNameField = TextFormField(
      autofocus:false,
      controller:lastNameEditingController,
      keyboardType: TextInputType.name,
      //validator: (){},
      onSaved: (value){
        lastNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.contact_mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        )
      ),
    );


// Email Here
    final emailField = TextFormField(
      autofocus:false,
      controller:emailEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator: (){},
      onSaved: (value){
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        )
      ),
    );


//Password Is Here
    final passwordField = TextFormField(
      autofocus:false,
      controller:passwordEditingController,
      obscureText: true,
      //validator: (){},
      onSaved: (value){
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        )
      ),
    );


//Confirm Password Is Here
    final confirmPasswordField = TextFormField(
      autofocus:false,
      controller:confirmPasswordEditingController,
      obscureText: true,
      //validator: (){},
      onSaved: (value){
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        )
      ),
    );


  final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepOrangeAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){},
        child: Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, color:Colors.white, fontWeight:FontWeight.bold
          ),
          ),
        ),
    );  


  return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.red),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(
                        height: 180,
                        child: Image.asset(
                          "assets/leader.png",
                          fit: BoxFit.contain,
                        )
                      ),

                      SizedBox(height: 45),
                      firstNameField,
                      SizedBox(height: 20),
                      lastNameField,

                      SizedBox(height: 20),
                      emailField,
                      SizedBox(height: 20),
                      passwordField,
                      SizedBox(height: 20),
                      confirmPasswordField,
                      SizedBox(height: 20),
                      signUpButton,
                      SizedBox(height: 15),
                    ],
                  )
              ),
            ),


          ),
        ),
      ),
    );
  }
}