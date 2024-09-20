import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/Auth/tree.dart';
import 'package:login/screens/login.dart';

import '../Auth/auth.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmpass = TextEditingController();
  bool _passobscure = true;
  bool _confirmpassobscure = true;
  bool _isLoading = false;
  GetNotifiedOfError(String error, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }
  Future<void> createUserWithEmailandPassword() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Auth().createUserWithEmailAndPassword(
          email: _email.text, password: _pass.text);

      setState(() {
        _isLoading = false;
        // loginOrCreate = true;
      });
      GetNotifiedOfError('Signed and Logged in successfully', Colors.black);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const WidgetTree()));
    } on FirebaseAuthException catch (e) {
      GetNotifiedOfError(e.message.toString(), Colors.black);
      setState(() {
        _isLoading = false;
      });
    }
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
                  // height: hieght*0.5,
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
                        margin: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _confirmpass,
                          obscureText: _confirmpassobscure,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _confirmpassobscure = !_confirmpassobscure;
                                });
                              },
                              child: const Icon(
                                FontAwesomeIcons.eye,
                                color: Colors.black,
                              ),
                            ),
                            labelText: "Conferma Password",
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
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text(
                              "Hai gia un account? ",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const Login();
                              }));
                            },
                            child: const Text(
                              "Login",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    "Accetto ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                const Text(
                  "termini e condizioni ",
                  style: TextStyle(
                    fontSize: 15,
                    shadows: [
                      Shadow(color: Colors.blue, offset: Offset(0, -1))
                    ],
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    decorationThickness: 1,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
                // const Text("termini e condizioni ",textAlign: TextAlign.center,style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue,fontSize: 15,),),
                Checkbox(value: true, onChanged: (value) {})
              ],
            ),
            InkWell(
              onTap: () {
                if (_email.text.isEmpty ||
                    _pass.text.isEmpty) {
                  
                } else {
                  if (RegExp(r'\S+@\S+\.\S+').hasMatch(_email.text)) {
                    if (_pass.text.length >= 6 ) {
  
                    if(_pass.text == _confirmpass.text) {  createUserWithEmailandPassword();}else{
                      GetNotifiedOfError(
                          'Confirm Password is Same as Password',
                          Colors.red);
                    }
                    } else {
                      GetNotifiedOfError(
                          'Your password must have at least 6 characters ',
                          Colors.red);
                    }
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
                  "Registrati",
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
