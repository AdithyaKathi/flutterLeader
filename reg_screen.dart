import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:leader/models/user_model.dart';
import 'package:leader/screens/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}



class _RegistrationScreenState extends State<RegistrationScreen> {

 final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = new TextEditingController();
  final lastNameEditingController = new TextEditingController();

  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    

    


//First Name Is Here
    final firstNameField = TextFormField(
      autofocus:false,
      controller:firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ("First Name Cannot Be Empty");
        }
        if(!regex.hasMatch(value)){
          return ("Enter Valid Name (Min. 3 Characters)");
        }
        return null;
      },
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
      validator: (value){
        if(value!.isEmpty){
          return ("Enter Your Last Name");
        }
        return null;
      },
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
      validator: (value){
        if(value!.isEmpty){
          return ("Enter Your Email");
        }
        // reg expression
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
          return ("Enter A Valid Email");
        }

        return null;
      },
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
      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return ("Enter Your Password");
        }
        if(!regex.hasMatch(value)){
          return ("Password Is Required For Login (Min. 6 Characters)");
        }
        return null;
      },
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
      validator: (value){
        if(confirmPasswordEditingController.text != passwordEditingController.text){
          return "Password Don't Match";
        }
        return null;
      },
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
        onPressed: (){
          signUp(emailEditingController.text, passwordEditingController.text);

        },
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

  void signUp(String email,String password) async{
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {
        postDetailsToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async{
    // calling firestore then user model and sending these values

    FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.lastName = lastNameEditingController.text;


    await firebaseFireStore
    .collection("Users")
    .doc(user.uid)
    .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully :) ");

    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => HomeScreen()), 
    (route) => false);
  }
}
