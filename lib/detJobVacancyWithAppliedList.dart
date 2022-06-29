import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/class/appliedclass.dart';
import 'package:project_uas/services/db_services.dart';
import 'package:project_uas/viewCreatedJobVacancy.dart';
import 'package:project_uas/ViewJobVacancyAppliedList.dart';

class detJobVacancyWithAppliedList extends StatelessWidget {
  final String uid;
  User? userDetection = FirebaseAuth.instance.currentUser;

  detJobVacancyWithAppliedList({Key? key, required this.uid}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<DocumentSnapshot<Object?>>(
              future: DatabaseJobVacancy.getData(uid),
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
                  String lvName = data['company-name'];

                  return Expanded(
                    child: Card(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: ListView(children: [
                        // Column(
                        // // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // children: [
                          Card(
                            child: ListTile(
                              title: Text('Job Name: ' + data['job-name']),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),

                          Card(
                            child: FutureBuilder<DocumentSnapshot<Object?>>(
                              future:
                                  DatabaseCompany.getData(lvName),
                              builder: (context, snapshot2) {
                                if (snapshot2.hasError) {
                                  return Text("Something went wrong");
                                }
                                if (snapshot2.hasData &&
                                    !snapshot2.data!.exists) {
                                  return Text("Document does not exist");
                                }
                                if (snapshot2.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data2 = snapshot2.data!
                                      .data() as Map<String, dynamic>;
                                  return
                                  ListTile(
                                    title: Text('Company Name: ' +
                                        data2['company-name']),
                                  );
                                  //   ],
                                  // );
                                }
                                return ListTile(
                                    title: Text('Loading Company'),
                                  );
                              },
                            ),
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),

                          
                          Card(
                            child: ListTile(
                              title:
                                  Text('Jenis Pekerjaan: ' + data['jenis-pekerjaan']),
                            ),
                            margin: EdgeInsets.all(10),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          Card(
                            child: ListTile(
                              title: Text('Minimum Education: ' + data['minimum-education']),
                            ),
                            margin: EdgeInsets.all(10),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          Card(
                            child: ListTile(
                              title: Text('Location: ' + data['lokasi']),
                            ),
                            margin: EdgeInsets.all(10),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          Card(
                            child: ListTile(
                              title: Column( 
                                        children: [
                                          Row(
                                            children: [
                                              Text("Job Description: "),
                                            ],
                                          ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: data['deskripsi-pekerjaan'].length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: Icon(Icons.circle),
                                                  title: Text(data['deskripsi-pekerjaan'][index]));
                                              },
                                            ), 
                                        ],
                                      ),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          
                          Card(
                            child: ListTile(
                              title: Column( 
                                        children: [
                                          Row(
                                            children: [
                                              Text("Qualification: "),
                                            ],
                                          ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: data['kualifikasi'].length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: Icon(Icons.circle),
                                                  title: Text(data['kualifikasi'][index]));
                                              },
                                            ), 
                                        ],
                                      ),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          Card(
                            child: ListTile(
                              title: Column( 
                                        children: [
                                          Row(
                                            children: [
                                              Text("Job Description: "),
                                            ],
                                          ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: data['skills'].length,
                                              itemBuilder: (context, index) {
                                                return ListTile(
                                                  leading: Icon(Icons.circle),
                                                  title: Text(data['skills'][index]));
                                              },
                                            ), 
                                        ],
                                      ),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          Card(
                            child: ListTile(
                              title:
                                  Text('Gaji: ' + data['gaji']),
                            ),
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          
                          
                      //   ],
                      // )
                      ],),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width / 3,
              child: FloatingActionButton.extended(
                  label: const Text('Back'),
                  icon: const Icon(Icons.arrow_back),
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width / 3,
              child: FloatingActionButton.extended(
                  label: const Text('Applied List'),
                  icon: const Icon(Icons.person),
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewJobVacancyAppliedList(jobVacancyUID: uid,)));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}