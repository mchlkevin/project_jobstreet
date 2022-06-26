import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/seeker_profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? userDetection = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 16,
          ),
          Text('Welcome ' + userDetection!.uid.toString()),
          SizedBox(height: 16),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 3,
            child: FlatButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SeekerProfile()));
              },
              child: Text("Edit Profile"),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 3,
            child: FlatButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {},
              child: Text("Lihat Lowongan"),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 3,
            child: FlatButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {},
              child: Text("Lihat Status Lowongan"),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 3,
            child: FlatButton(
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text("Sign Out"),
            ),
          ),
        ]),
      ),
    );
  }
}
