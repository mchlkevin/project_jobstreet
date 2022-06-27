import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/company_profile.dart';
import 'package:project_uas/services/db_services.dart';

class HomeScreenCompany extends StatefulWidget {
  @override
  _HomeScreenCompanyState createState() => _HomeScreenCompanyState();
}

class _HomeScreenCompanyState extends State<HomeScreenCompany> {
  User? userDetection = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    super.dispose();
  }

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
            future: DatabaseCompany.getData(userDetection!.uid),
            builder: (context, snapshot) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Column(children: [
                Text('Welcome ' + data['company-name']),
              ]);
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
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
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
              onPressed: () {},
              child: Text("Buat Lowongan"),
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
