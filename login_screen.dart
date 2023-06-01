import 'package:flutter/material.dart';
import 'package:leader/screens/home_screen.dart';
import 'package:leader/screens/reg_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();





  @override
  Widget build(BuildContext context) {

    //email field
    final emailField = TextFormField(
      autofocus:false,
      controller:emailController,
      keyboardType: TextInputType.emailAddress,
      //validator: (){},
      onSaved: (value){
        emailController.text = value!;
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



    final passwordField = TextFormField(
      autofocus:false,
      controller:passwordController,
      obscureText: true,
      //validator: (){},
      onSaved: (value){
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
        )
      ),
    );
    

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepOrangeAccent,

      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, color:Colors.white, fontWeight:FontWeight.bold
          ),
          ),
        ),
    );
     
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/leader.png",
                          fit: BoxFit.contain,
                        )
                      ),

                      SizedBox(
                        height: 45
                      ),


                      emailField,
                      SizedBox(height: 45),
                      passwordField,
                      SizedBox(height: 35),
                      loginButton,
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          Text("Don't Have An Account? "),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => 
                                    RegistrationScreen()
                                )
                              );
                                     
                            },
                            child: Text("Sign Up",style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontWeight: FontWeight.bold,fontSize: 15),
                          ),
                          )
                        ],
                      )
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
