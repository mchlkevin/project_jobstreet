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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN / SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Insert email...",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 50,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Insert password...",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 3,
              child: FlatButton(
                textColor: Colors.black,
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

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
                },
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 3,
              child: FlatButton(
                textColor: Colors.black,
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

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
                        User? user = FirebaseAuth.instance.currentUser;

                        await FirebaseFirestore.instance
                            .collection("job-seeker")
                            .doc(user?.uid)
                            .set({
                          'uid': user?.uid,
                          'email': email,
                          'password': password,
                          'jobSeeker': true
                        });
                      });
                    }
                  }
                },
                child: Text(
                  "Sign Up as Job Seeker",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 3,
              child: FlatButton(
                textColor: Colors.black,
                onPressed: () {
                  final String email = emailController.text.trim();
                  final String password = passwordController.text.trim();

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
                        User? user = FirebaseAuth.instance.currentUser;

                        await FirebaseFirestore.instance
                            .collection("company")
                            .doc(user?.uid)
                            .set({
                          'uid': user?.uid,
                          'email': email,
                          'password': password,
                          'jobSeeker': false
                        });
                      });
                    }
                  }
                },
                child: Text(
                  "Sign Up as Company",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
