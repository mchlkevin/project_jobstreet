import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_uas/services/auth_services.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade500,
      body: Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Image.asset(
                  'assets/images/profile.png',
                  height: 200,
                  width: 200,
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Sign Up / Log In',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: emailController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.mail),
                          suffixIcon: emailController.text.isEmpty
                              ? Text('')
                              : GestureDetector(
                                  onTap: () {
                                    emailController.clear();
                                  },
                                  child: Icon(Icons.close)),
                          hintText: 'example@mail.com',
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.pink, width: 1))),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      obscureText: isVisible,
                      controller: passwordController,
                      onChanged: (value) {
                        print(value);
                      },
                      //
                      decoration: InputDecoration(
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                isVisible = !isVisible;
                                setState(() {});
                              },
                              child: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          hintText: 'type your password',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1))),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 45,
                      width: 250,
                      child: FloatingActionButton.extended(
                          label: const Text('Sign up (Job seeker)'),
                          icon: const Icon(Icons.person),
                          backgroundColor: Colors.pink,
                          onPressed: () {
                            final String email = emailController.text.trim();
                            final String password =
                                passwordController.text.trim();

                            if (email.isEmpty) {
                              print("Email is Empty");
                            } else {
                              if (password.isEmpty) {
                                print("Password is Empty");
                              } else {
                                context
                                    .read<AuthService>()
                                    .signUpSeeker(
                                      email,
                                      password,
                                    )
                                    .then((value) async {
                                  User? user =
                                      FirebaseAuth.instance.currentUser;

                                  await FirebaseFirestore.instance
                                      .collection("job-seeker")
                                      .doc(user?.uid)
                                      .set({
                                    'uid': user?.uid,
                                    'email': email,
                                    'password': password,
                                    'jobSeeker': true,
                                    'interest-on': ' ',
                                    'major-in': ' ',
                                    'domicile': ' ',
                                    'full-name': ' ',
                                  });
                                });
                              }
                            }
                          }),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 45,
                      width: 250,
                      child: FloatingActionButton.extended(
                          label: const Text('Sign up (Company)'),
                          icon: const Icon(Icons.work),
                          backgroundColor: Colors.pink,
                          onPressed: () {
                            final String email = emailController.text.trim();
                            final String password =
                                passwordController.text.trim();

                            if (email.isEmpty) {
                              print("Email is Empty");
                            } else {
                              if (password.isEmpty) {
                                print("Password is Empty");
                              } else {
                                context
                                    .read<AuthService>()
                                    .signUpCompany(
                                      email,
                                      password,
                                    )
                                    .then((value) async {
                                  User? user =
                                      FirebaseAuth.instance.currentUser;

                                  await FirebaseFirestore.instance
                                      .collection("company")
                                      .doc(user?.uid)
                                      .set({
                                    'uid': user?.uid,
                                    'email': email,
                                    'password': password,
                                    'jobSeeker': false,
                                    'company-name': ' ',
                                    'company-field': ' ',
                                    'description': ' ',
                                    'company-adress': ' '
                                  });
                                });
                              }
                            }
                          }),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 45,
                      width: 250,
                      child: FloatingActionButton.extended(
                          label: const Text('Log In'),
                          icon: const Icon(Icons.login),
                          backgroundColor: Colors.pink,
                          onPressed: () {
                            final String email = emailController.text.trim();
                            final String password =
                                passwordController.text.trim();

                            if (email.isEmpty) {
                              print("Email is Empty");
                            } else {
                              if (password.isEmpty) {
                                print("Password is Empty");
                              } else {
                                context.read<AuthService>().login(
                                      email,
                                      password,
                                    );
                              }
                            }
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
