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

  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {});
    
    return DatabaseJobVacancy.getsAllData("");
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
            FlatButton(
              textColor: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          DocumentSnapshot dsData = snapshot.data!.docs[index];
                          String lvcName = dsData['job-name'];
                          List lvcDesc = dsData['deskripsi-pekerjaan'];
                          String lvcLoc = dsData['lokasi'];
                          String lvcjobtype = dsData['jenis-pekerjaan'];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detJobVacancy(
                                      uid: dsData['uid'],
                                    ),
                                  ));
                            },
                            title: Text(lvcName, 
                            // style: TextStyle(backgroundColor: Color.fromARGB(141, 146, 240, 146)),
                            ),
                            subtitle: 
                                Column( 
                                  children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: lvcDesc.length,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: Icon(Icons.circle),
                                            title: Text(lvcDesc[index]));
                                        },
                                      ),
                                    Text(lvcLoc)
                                  ],
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
          ],
        ),
      ),
    );
  }
}
