

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:store_app/shared/Snackbar.dart';
import 'login.dart';




class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}
final _formKey = GlobalKey<FormState>();
class _RegisterState extends State<Register> {
  bool isvisible= true;
  bool isLoading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  register() async {
    setState(() {
      isLoading = true;
    });

    try {
      final Credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
       // print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              action: SnackBarAction(
                label: 'Action',
                onPressed: () {
                  // Code to execute.
                },
              ),
              content: const Text('Awesome SnackBar!'),
              duration: const Duration(milliseconds: 1500),
              width: 280.0, // Width of the SnackBar.
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0, // Inner padding for SnackBar content.
              ),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),

              ),
            ));


      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(33.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    TextField(
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: "Enter Your username : ",
                          suffixIcon: Icon(Icons.person)
                        )),
                    const SizedBox(
                      height: 33,
                    ),
                    TextFormField(
                        validator: (value) {return value != null &&
                            !EmailValidator.validate(value) ?
                        "Enter a valid email" : null;},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: "Enter Your Email : ",
                            suffixIcon: Icon(Icons.email)
                        )),
                    const SizedBox(
                      height: 33,
                    ),
                   TextFormField(
                       validator: (value) {return value!.length<8?

                       "Enter at least 8 characters" : null;},
                       autovalidateMode: AutovalidateMode.onUserInteraction,

                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: isvisible?true :false,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password : ",
                            suffixIcon: IconButton(

                                onPressed :(){
                                  setState(() {
                                    isvisible=!isvisible;
                                  });
                                },


                                icon:isvisible? Icon(Icons.visibility):

                                Icon(Icons.visibility_off)

                            )


                        )),
                    const SizedBox(
                      height: 33,
                    ),
                    ElevatedButton(
                      onPressed: (){

    if (_formKey.currentState!.validate()) {
      register();
    }  else {
      showSnackBar(context, 'error');
    }


                      },
                      child: isLoading
                          ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text(
                        "Register",
                        style: TextStyle(fontSize: 19),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do not have an account?",
                            style: TextStyle(fontSize: 18)),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>const  Login()),
                              );
                            },
                            child: Text('sign in',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
