import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/class/companyclass.dart';
import 'package:project_uas/class/vacancyclass.dart';
import 'package:project_uas/services/db_services.dart';
import 'package:uuid/uuid.dart';

class createJobVacancy extends StatefulWidget {
  const createJobVacancy({Key? key}) : super(key: key);

  @override
  State<createJobVacancy> createState() => _createJobVacancy();
}

class _createJobVacancy extends State<createJobVacancy> {
  // TextEditingController companyName = new TextEditingController();
  TextEditingController jobDesc = new TextEditingController();
  TextEditingController gaji = new TextEditingController();
  TextEditingController jenisPekerjaan = new TextEditingController();
  TextEditingController namaPekerjaan = new TextEditingController();
  TextEditingController kualifikasi = new TextEditingController();
  TextEditingController lokasi = new TextEditingController();
  TextEditingController minimumEdukasi = new TextEditingController();
  TextEditingController skills = new TextEditingController();

  User? userDetection = FirebaseAuth.instance.currentUser;
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: [
          SizedBox(
            height: 16,
          ),
          Text("Create Job Vacancy",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(
            height: 16,
          ),
          SizedBox(height: 16),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Container(
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 220, 236, 244),
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextField(
                  controller: namaPekerjaan,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Job Name",
                      hintText: "Enter Job Name"),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: jobDesc,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Job Description (Use ; to split the item)",
                      hintText: "Enter Job Description"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: jenisPekerjaan,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Job Type',
                      hintText: "Enter Job Type"),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: gaji,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Salary",
                      hintText: "Enter Job Salary"),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: kualifikasi,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Qualification (Use ; to split the item)",
                      hintText: "Enter Job Qualification"),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: lokasi,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Location",
                      hintText: "Enter Job Location"),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: minimumEdukasi,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Minimum Education",
                      hintText: "Enter Job Minimum Education"),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: skills,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Skills (Use ; to split the item)",
                      hintText: "Enter Job Skills"),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 16,
          ),
          Center(
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width / 3,
              child: FloatingActionButton.extended(
                  label: const Text('Simpan Data'),
                  icon: const Icon(Icons.save),
                  backgroundColor: Colors.pink,
                  onPressed: () {
                    final data = classvacancy(
                        uid: uuid.v4(),
                        companyName: userDetection!.uid,
                        jobDescription: jobDesc.text.split(';'),
                        gaji: gaji.text,
                        jenisPekerjaan: jenisPekerjaan.text,
                        namaPekerjaan: namaPekerjaan.text,
                        kualifikasi: kualifikasi.text.split(';'),
                        lokasi: lokasi.text,
                        minimumEdukasi: minimumEdukasi.text,
                        skills: skills.text.split(';'));
                    DatabaseJobVacancy.tambahData(item: data);
                    Navigator.pop(context);
                  }),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Center(
            child: Container(
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
          ),
          SizedBox(
            height: 16,
          ),
        ]),
      ),
    );
  }
}
