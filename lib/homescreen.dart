import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/seeker_profile.dart';
import 'package:project_uas/services/db_services.dart';
import 'package:project_uas/viewAppliedJobVacancy.dart';
import 'package:project_uas/viewCompanyList.dart';
import 'package:project_uas/viewJobVacancy.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, children: [
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
                return Text(
                  'Welcome ' + data['full-name'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                );
              }
              return CircularProgressIndicator();
            },
          ),
          SizedBox(height: 24),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width / 3,
            child: FloatingActionButton.extended(
              label: const Text('Edit profile'),
              icon: const Icon(Icons.person),
              backgroundColor: Colors.pink,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SeekerProfile()));
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width / 3,
            child: FloatingActionButton.extended(
              label: const Text('Company list'),
              icon: const Icon(Icons.list),
              backgroundColor: Colors.pink,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewCompanyList()));
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width / 3,
            child: FloatingActionButton.extended(
              label: const Text('View Job'),
              icon: const Icon(Icons.remove_red_eye_outlined),
              backgroundColor: Colors.pink,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => viewJobVacancy()));
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width / 3,
            child: FloatingActionButton.extended(
              label: const Text('View Status'),
              icon: const Icon(Icons.history),
              backgroundColor: Colors.pink,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => viewAppliedJobVacancy()));
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width / 3,
            child: FloatingActionButton.extended(
              label: const Text('Sign out'),
              icon: const Icon(Icons.login_outlined),
              backgroundColor: Colors.pink,
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
