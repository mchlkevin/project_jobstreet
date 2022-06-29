

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/services/db_services.dart';
import 'package:url_launcher/url_launcher.dart';

class sendEmail extends StatelessWidget {
  final String uid;

  sendEmail({Key? key, required this.uid}) : super(key: key);

  TextEditingController subjectController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                    children: [
                      Text(
                        'Email to ' + data['email'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                              controller: subjectController,
                              decoration: InputDecoration(
                                hintText: "Insert subject...",
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                              controller: bodyController,
                              decoration: InputDecoration(
                                hintText: "Insert body...",
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 3,
                        child: FloatingActionButton.extended(
                            label: const Text('Send Email'),
                            icon: const Icon(Icons.email),
                            backgroundColor: Colors.pink,
                            onPressed: () async {
                              String subject = subjectController.text;
                              String body = bodyController.text;

                              final Uri email = Uri(
                                scheme: 'mailto',
                                path: data['email'],
                                query: 'subject=' +
                                    Uri.encodeComponent(subject) +
                                    '&body=' +
                                    Uri.encodeComponent(body),
                              );

                              if (await canLaunchUrl(email)) {
                                await launchUrl(email);
                              } else {
                                debugPrint('error');
                              }
                            }),
                      ),
                      SizedBox(
                        height: 20,
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
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
