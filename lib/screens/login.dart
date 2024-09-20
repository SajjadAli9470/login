import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/screens/register.dart';

import '../Auth/auth.dart';
import '../Auth/tree.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmpass = TextEditingController();
  bool _passobscure = true;
  final bool _confirmpassobscure = true;

  final User? user = Auth().currentUser;
  bool loginOrCreate = true;
  String? errorMessage = '';
  String email = "";
  String password = "";
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerpassword = TextEditingController();

  var isEmpty = false;
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;

  GetNotifiedOfError(String error, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  Future<void> signInWithEmailandPassword() async {
    try {
      // setState(() {
      //   _isLoading = true;
      // });
      await Auth().signInWithEmailAndPassword(
          email: _email.text, password: _pass.text);

      setState(() {
        _isLoading = false;
        loginOrCreate = true;
      });
      GetNotifiedOfError('Logged in successfullyy', Colors.black);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const WidgetTree()));
    } on FirebaseAuthException catch (e) {
      GetNotifiedOfError(e.message.toString(), Colors.black);
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _onSubmit() async {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 4), () async {
      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final hieght = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Center(
        child: Container(
          // height: hieght*0.9,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: EdgeInsets.only(
                      top: hieght * 0.08, bottom: hieght * 0.08),
                  child: Image(
                    image: const AssetImage(
                      "assets/logo.png",
                    ),
                    height: width * 0.2,
                    width: width * 0.2,
                  ),
                ),
                SizedBox(
                  child: Form(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            labelText: "Email",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: "",
                            contentPadding:
                                const EdgeInsets.fromLTRB(8, 12, 0, 12),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          style: const TextStyle(),
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _pass,
                          obscureText: _passobscure,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _passobscure = !_passobscure;
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.eye,
                                color: Colors.black,
                              ),
                            ),
                            labelText: "Password",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            counterText: "",
                            contentPadding:
                                const EdgeInsets.fromLTRB(8, 12, 0, 12),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          style: const TextStyle(),
                          validator: (value) {
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image(
                                    image: AssetImage("assets/alogo.png"),
                                    height: 20,
                                  ),
                                  Text(
                                    "Apple",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap:() async {
                
          try {
           await Auth().signInwithGoogle();
             Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const WidgetTree()));
    
          
          } catch(e){
            if(e is FirebaseAuthException){
             GetNotifiedOfError(e.message.toString(), Colors.black);
            }
          } },
          child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image(
                                      image: AssetImage("assets/glogo.png"),
                                      height: 20,
                                    ),
                                    Text(
                                      "Google",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text(
                              "Non hai ancora un account?",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const RegisterUser();
                              }));
                            },
                            child: const Text(
                              "Registrarti",
                              style: TextStyle(
                                fontSize: 15,
                                shadows: [
                                  Shadow(
                                      color: Colors.blue, offset: Offset(0, -1))
                                ],
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue,
                                decorationThickness: 1,
                                decorationStyle: TextDecorationStyle.solid,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: hieght * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (_email.text.isEmpty ||
                    _pass.text.isEmpty) {
                  setState(() {
                    isEmpty = true;
                  });
                } else {
                  if (RegExp(r'\S+@\S+\.\S+').hasMatch(_email.text)) {
                    // if (true) {
                    //   setState(() {
                    //     isEmpty = false;
                    //   });

                      // log('$_isLoading');
                      // loginOrCreate
                      //     ?
                      signInWithEmailandPassword();
                      // :
                      // createUserWithEmailandPassword();
                    // } else {
                    //   GetNotifiedOfError(
                    //       'Your password must have at least 6 characters ',
                    //       Colors.black);
                    // }
                  } else {
                    GetNotifiedOfError(
                        'Enter valid email address', Colors.black);
                  }
                }
              },
              child: Container(
                width: width * 0.9,
                height: hieght * 0.08,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
