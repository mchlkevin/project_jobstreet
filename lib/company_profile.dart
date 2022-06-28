import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/class/companyclass.dart';
import 'package:project_uas/services/db_services.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({Key? key}) : super(key: key);

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  TextEditingController cName = new TextEditingController();
  TextEditingController cAdress = new TextEditingController();
  TextEditingController cField = new TextEditingController();
  TextEditingController cDescription = new TextEditingController();
  User? userDetection = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 16,
          ),
          Text("Edit Profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: cName,
                  decoration: InputDecoration(
                    hintText: "Insert company name...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
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
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: cAdress,
                  decoration: InputDecoration(
                    hintText: "Insert company adress...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
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
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: cField,
                  decoration: InputDecoration(
                    hintText: "Insert company field...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
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
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: cDescription,
                  decoration: InputDecoration(
                    hintText: "Insert company description...",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width / 3,
            child: FloatingActionButton.extended(
                label: const Text('Update profile'),
                icon: const Icon(Icons.update),
                backgroundColor: Colors.pink,
                onPressed: () {
                  final dt = classCompany(
                      uid: userDetection!.uid,
                      name: cName.text,
                      adress: cAdress.text,
                      field: cField.text,
                      description: cDescription.text);
                  DatabaseCompany.tambahData(item: dt);
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
        ]),
      ),
    );
  }
}
