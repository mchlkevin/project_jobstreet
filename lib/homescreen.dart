import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/seeker_profile.dart';
import 'package:project_uas/services/db_services.dart';
import 'package:project_uas/viewCompanyList.dart';

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
          FutureBuilder<DocumentSnapshot<Object?>>(
            future: DatabaseSeeker.getData(userDetection!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }
              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Text('Welcome ' + data['full-name']);
              }
              return CircularProgressIndicator();
            },
          ),
          SizedBox(height: 16),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 3,
            child: FlatButton(
              color: Colors.lightBlue,
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
              color: Colors.lightBlue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewCompanyList()));
              },
              child: Text("View Company List"),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 3,
            child: FlatButton(
              color: Colors.lightBlue,
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
              color: Colors.lightBlue,
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
              color: Colors.lightBlue,
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
