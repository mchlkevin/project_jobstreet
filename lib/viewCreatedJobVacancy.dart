import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/detJobVacancyWithAppliedList.dart';
import 'package:project_uas/seeker_profile.dart';
import 'package:project_uas/services/db_services.dart';
import 'package:project_uas/viewCompanyList.dart';
import 'package:project_uas/class/vacancyclass.dart';
import 'package:project_uas/detJobVacancy.dart';
import 'package:project_uas/detJobVacancyWithApply.dart';

class viewCreatedJobVacancy extends StatefulWidget {
  const viewCreatedJobVacancy({Key? key}) : super(key: key);

  @override
  State<viewCreatedJobVacancy> createState() => _viewCreatedJobVacancy();
}

class _viewCreatedJobVacancy extends State<viewCreatedJobVacancy> {
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

    return DatabaseJobVacancy.getsAllData(userDetection!.uid);
  }

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
              child: StreamBuilder<QuerySnapshot>(
                stream: onSearch(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error');
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return Card(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            DocumentSnapshot dsData =
                                snapshot.data!.docs[index];
                            String comp = dsData['company-name'];
                            // DocumentReference companyRef = FirebaseFirestore.instance.collection("company").doc(test);
                            // Future company = companyRef.get();
                            // var map;

                            // company.then((value) => map = value);
                            // Map<String, dynamic> data =  map;
                            // String lvcName = data['company-name'];

                            String lvcName = dsData['job-name'];
                            List lvcDesc = dsData['deskripsi-pekerjaan'];
                            String lvcLoc = dsData['lokasi'];
                            String lvcjobtype = dsData['jenis-pekerjaan'];
                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          detJobVacancyWithAppliedList(
                                        uid: dsData['uid'],
                                      ),
                                    ));
                              },
                              // title: Text(lvcName,
                              // // style: TextStyle(backgroundColor: Color.fromARGB(141, 146, 240, 146)),
                              // ),
                              title: Text(lvcName),
                              subtitle: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Text(lvcjobtype),
                                      Text(lvcLoc)
                                    ],
                                  ),

                                  // ListView.builder(
                                  //   shrinkWrap: true,
                                  //   itemCount: lvcDesc.length,
                                  //   itemBuilder: (context, index) {
                                  //     return ListTile(
                                  //       leading: Icon(Icons.circle),
                                  //       title: Text(lvcDesc[index]));
                                  //   },
                                  // ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 8.0,
                              ),
                          itemCount: snapshot.data!.docs.length),
                    );
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
          ],
        ),
      ),
    );
  }
}
