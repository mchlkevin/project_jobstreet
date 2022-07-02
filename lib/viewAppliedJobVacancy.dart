import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/seeker_profile.dart';
import 'package:project_uas/services/db_services.dart';
import 'package:project_uas/viewCompanyList.dart';
import 'package:project_uas/class/vacancyclass.dart';
import 'package:project_uas/detJobVacancy.dart';

class viewAppliedJobVacancy extends StatefulWidget {
  const viewAppliedJobVacancy({Key? key}) : super(key: key);

  @override
  State<viewAppliedJobVacancy> createState() => _viewAppliedJobVacancy();
}

class _viewAppliedJobVacancy extends State<viewAppliedJobVacancy> {
  User? userDetection = FirebaseAuth.instance.currentUser;
  // final _searchText = TextEditingController();

  @override
  void dispose() {
    // _searchText.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // _searchText.addListener(onSearch);
    // classvacancy data = classvacancy(uid: "fmnP9M7aryH3MN6Qjvw8", companyName: "Tencent", jobDescription: ["A", "B", "C"], gaji: "4.000.000", jenisPekerjaan: "Part Time", namaPekerjaan: "Software Designer", kualifikasi: ["D", "E", "F"], lokasi: "Jakarta, Jawa Tengah, Indonesia", minimumEdukasi: "S1", skills: ["G", "H", "I"]);
    // DatabaseJobVacancy.tambahData(item: data);
    super.initState();
  }

  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});

    return DatabaseAppliedJobVacancy.getsAllData(userDetection!.uid);
  }

  // Stream<QuerySnapshot<Object?>> onSearch2(String uid) {
  //   setState(() {});

  //   return DatabaseJobVacancy.getsAllData(uid);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(8, 20, 8, 8),
        child: Column(
          children: [
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
            // TextField(
            //   controller: _searchText,
            //   decoration: InputDecoration(
            //     prefixIcon: Icon(Icons.search),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: BorderSide(color: Colors.blue),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Card(
                child: StreamBuilder<QuerySnapshot>(
                  stream: onSearch(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error');
                    } else if (snapshot.hasData || snapshot.data != null) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            DocumentSnapshot dsData =
                                snapshot.data!.docs[index];
                            String lvcName = dsData['job-vacancy'];
                            String lvcStatus = dsData['status'];
                            Color statusCol;
                            if (lvcStatus == 'Failed') {
                              statusCol = Color.fromARGB(177, 255, 0, 0);
                            } else if (lvcStatus == 'Success') {
                              statusCol = Color.fromARGB(177, 124, 239, 124);
                            } else {
                              statusCol = Color.fromARGB(123, 255, 255, 255);
                            }

                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => detJobVacancy(
                                        uid: lvcName,
                                      ),
                                    ));
                              },
                              title: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FutureBuilder<DocumentSnapshot<Object?>>(
                                        future:
                                            DatabaseJobVacancy.getData(lvcName),
                                        builder: (context, snapshot2) {
                                          if (snapshot2.hasError) {
                                            return Text("Something went wrong");
                                          }
                                          if (snapshot2.hasData &&
                                              !snapshot2.data!.exists) {
                                            return Text(
                                                "Document does not exist");
                                          }
                                          if (snapshot2.connectionState ==
                                              ConnectionState.done) {
                                            Map<String, dynamic> data =
                                                snapshot2.data!.data()
                                                    as Map<String, dynamic>;
                                            return
                                                // Row(
                                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                //   children: [
                                                Text(data['job-name']);
                                            //   ],
                                            // );
                                          }
                                          return Text("Loading Job Name");
                                        },
                                      ),
                                      Card(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 8,
                                              height: 20,
                                            ),
                                            Text(lvcStatus),
                                            SizedBox(
                                              width: 8,
                                              height: 20,

                                            ),
                                          ],
                                        ),
                                        color: statusCol,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              subtitle:
                                  FutureBuilder<DocumentSnapshot<Object?>>(
                                future: DatabaseJobVacancy.getData(lvcName),
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
                                    Map<String, dynamic> data = snapshot2.data!
                                        .data() as Map<String, dynamic>;
                                    return
                                        // Row(
                                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //   children: [
                                        Text(data['lokasi']);
                                    //   ],
                                    // );
                                  }
                                  return Text("Loading Job Name");
                                },
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 8.0,
                              ),
                          itemCount: snapshot.data!.docs.length);
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
