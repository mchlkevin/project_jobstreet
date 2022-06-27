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
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Company Name: ' + data['company-name']),
                    SizedBox(
                      height: 16,
                    ),
                    Text('Company Field: ' + data['company-field']),
                    SizedBox(
                      height: 16,
                    ),
                    Text('Company Adress: ' + data['company-adress']),
                    SizedBox(
                      height: 16,
                    ),
                    Text('Description: ' + data['description']),
                  ],
                );
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
