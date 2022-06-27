import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/services/db_services.dart';

class detCompany extends StatelessWidget {
  final String uid;
  const detCompany({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<DocumentSnapshot<Object?>>(
              future: DatabaseCompany.getData(uid),
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                        child: ListTile(
                          title: Text('Company Name: ' + data['company-name']),
                        ),
                        elevation: 8,
                        shadowColor: Colors.pink,
                        margin: EdgeInsets.all(20),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      Card(
                        child: ListTile(
                          title:
                              Text('Company Field: ' + data['company-field']),
                        ),
                        elevation: 8,
                        shadowColor: Colors.pink,
                        margin: EdgeInsets.all(20),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      Card(
                        child: ListTile(
                          title:
                              Text('Company Adress: ' + data['company-adress']),
                        ),
                        elevation: 8,
                        shadowColor: Colors.pink,
                        margin: EdgeInsets.all(20),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Description: ' + data['description']),
                        ),
                        elevation: 8,
                        shadowColor: Colors.pink,
                        margin: EdgeInsets.all(20),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            ),
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
          ],
        ),
      ),
    );
  }
}
