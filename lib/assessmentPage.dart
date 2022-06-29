import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/class/appliedclass.dart';
import 'package:project_uas/services/db_services.dart';

class assessmentPage extends StatelessWidget {
  final String uid;
  final String uidJobVacancy;
  const assessmentPage({Key? key, required this.uid, required this.uidJobVacancy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<DocumentSnapshot<Object?>>(
              future: DatabaseSeeker.getData(uid),
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
                  String lvName = data['full-name'];
                  return Expanded(
                    child: Card(
                      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: ListView(
                        children: [
                          // Column(
                          // // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // children: [
                          Card(
                            child: ListTile(
                              title: Text('Full Name: ' + data['full-name']),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          
                          Card(
                            child: ListTile(
                              title: Text('Major In: ' +
                                  data['major-in']),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          Card(
                            child: ListTile(
                              title: Text('Interest On: ' +
                                  data['interest-on']),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          Card(
                            child: ListTile(
                              title: Text('Email: ' + data['email']),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          
                          Card(
                            child: ListTile(
                              title: Text('Domicile: ' + data['domicile']),
                            ),
                            elevation: 8,
                            shadowColor: Colors.green,
                            margin: EdgeInsets.all(20),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                          ),

                          //   ],
                          // )
                        ],
                      ),
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
                  label: const Text('Accept'),
                  icon: const Icon(Icons.arrow_back),
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    appliedclass items = appliedclass(uidPerson: uid, uidJobVacancy: uidJobVacancy, Status: "Success");
                    DatabaseAppliedJobVacancy.ubahData(item: items);
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
                  label: const Text('Decline'),
                  icon: const Icon(Icons.arrow_back),
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    appliedclass items = appliedclass(uidPerson: uid, uidJobVacancy: uidJobVacancy, Status: "Failed");
                    DatabaseAppliedJobVacancy.ubahData(item: items);
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
