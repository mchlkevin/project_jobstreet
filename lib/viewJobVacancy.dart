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
import 'package:project_uas/detJobVacancyWithApply.dart';

class viewJobVacancy extends StatefulWidget {
  const viewJobVacancy({Key? key}) : super(key: key);

  @override
  State<viewJobVacancy> createState() => _viewJobVacancyState();
}

class _viewJobVacancyState extends State<viewJobVacancy> {
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

  static Future<int> thisExpectedGaji(String uid) async{
    final QuerySnapshot result = await FirebaseFirestore.instance
    .collection('job-seeker')
    .where('uid', isEqualTo: uid)
    .limit(1)
    .get();
    
    print(result);
  
  final DocumentSnapshot documents = result.docs[0];
  int gaji = documents['expected-gaji'];
  return gaji;
  }
  
  Future<QuerySnapshot<Object?>> onSearch()async {
    setState(() {});
    var a = await thisExpectedGaji(userDetection!.uid);
    
    return DatabaseJobVacancy.getsAllDataWithSort(a);
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
              child: FutureBuilder<QuerySnapshot<Object?>>(
                future: onSearch(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error');
                  // } else if (snapshot.hasData || snapshot.data != null) {
                  }else {
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
                                          detJobVacancyWithApply(
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
                                      FutureBuilder<DocumentSnapshot<Object?>>(
                                        future: DatabaseCompany.getData(comp),
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
                                                Text(data['company-name']);
                                            //   ],
                                            // );
                                          }
                                          return Text("Loading Company");
                                        },
                                      ),
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
