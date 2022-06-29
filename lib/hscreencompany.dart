import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/company_profile.dart';
import 'package:project_uas/createJobVacancy.dart';
import 'package:project_uas/services/db_services.dart';
import 'package:project_uas/viewCreatedJobVacancy.dart';


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
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }
              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Column(children: [
                  Text('Welcome ' + data['company-name'],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ]);
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
                    MaterialPageRoute(builder: (context) => CompanyProfile()));
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
              label: const Text('Buat lowongan'),
              icon: const Icon(Icons.add),
              backgroundColor: Colors.pink,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => createJobVacancy()));
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
              label: const Text('Lihat lowongan'),
              icon: const Icon(Icons.assessment ),
              backgroundColor: Colors.pink,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => viewCreatedJobVacancy()));
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
              icon: const Icon(Icons.logout_outlined),
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
