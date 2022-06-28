import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/class/seekerclass.dart';
import 'package:project_uas/services/db_services.dart';

class SeekerProfile extends StatefulWidget {
  const SeekerProfile({Key? key}) : super(key: key);

  @override
  State<SeekerProfile> createState() => _SeekerProfileState();
}

class _SeekerProfileState extends State<SeekerProfile> {
  TextEditingController cFullName = new TextEditingController();
  TextEditingController cDomicile = new TextEditingController();
  TextEditingController cInterestOn = new TextEditingController();
  TextEditingController cLastEducation = new TextEditingController();
  TextEditingController cMajorIn = new TextEditingController();

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
                  controller: cFullName,
                  decoration: InputDecoration(
                    hintText: "Insert Full name...",
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
                  controller: cDomicile,
                  decoration: InputDecoration(
                    hintText: "Insert domicile...",
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
                  controller: cLastEducation,
                  decoration: InputDecoration(
                    hintText: "Insert last education...",
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
                  controller: cMajorIn,
                  decoration: InputDecoration(
                    hintText: "Insert major in...",
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
                  controller: cInterestOn,
                  decoration: InputDecoration(
                    hintText: "Insert interest on...",
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
                  final dt = classSeeker(
                      uid: userDetection!.uid,
                      major: cMajorIn.text,
                      fullName: cFullName.text,
                      interestOn: cInterestOn.text,
                      domicile: cDomicile.text);
                  DatabaseSeeker.tambahData(item: dt);
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
