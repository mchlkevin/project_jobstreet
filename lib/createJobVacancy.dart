import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_uas/class/companyclass.dart';
import 'package:project_uas/class/vacancyclass.dart';
import 'package:project_uas/services/db_services.dart';

class createJobVacancy extends StatefulWidget {
  const createJobVacancy({Key? key}) : super(key: key);

  @override
  State<createJobVacancy> createState() => _createJobVacancy();
}

class _createJobVacancy extends State<createJobVacancy> {
  TextEditingController companyName = new TextEditingController();
  TextEditingController jobDesc = new TextEditingController();
  TextEditingController gaji = new TextEditingController();
  TextEditingController jenisPekerjaan = new TextEditingController();
  TextEditingController namaPekerjaan = new TextEditingController();
  TextEditingController kualifikasi = new TextEditingController();
  TextEditingController lokasi = new TextEditingController();
  TextEditingController minimumEdukasi = new TextEditingController();
  TextEditingController skills = new TextEditingController();

  User? userDetection = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView( children: [
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
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: companyName,
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
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: namaPekerjaan,
                  decoration: InputDecoration(
                    hintText: "Insert Job Name...",
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
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: jobDesc,
                  decoration: InputDecoration(
                    hintText: "Insert Job Description...(use ; to split the item)",
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
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: jenisPekerjaan,
                  decoration: InputDecoration(
                    hintText: "Insert Job Type...",
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
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: gaji,
                  decoration: InputDecoration(
                    hintText: "Insert Job Salary...",
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
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: kualifikasi,
                  decoration: InputDecoration(
                    hintText: "Insert Job Qualification...(use ; to split the item)",
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
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: lokasi,
                  decoration: InputDecoration(
                    hintText: "Insert Job Location...",
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
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: minimumEdukasi,
                  decoration: InputDecoration(
                    hintText: "Insert Job Minimum Education Requirement...",
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
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  controller: skills,
                  decoration: InputDecoration(
                    hintText: "Insert Job Skills...(use ; to split the item)",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 16,
          ),
          FlatButton(
              textColor: Colors.black,
              onPressed: () {
                final data = classvacancy(
                  uid: "",
                  companyName: companyName.text,
                  jobDescription: jobDesc.text.split(';'),
                  gaji: gaji.text,
                  jenisPekerjaan: jenisPekerjaan.text,
                  namaPekerjaan: namaPekerjaan.text,
                  kualifikasi: kualifikasi.text.split(';'),
                  lokasi: lokasi.text,
                  minimumEdukasi: minimumEdukasi.text,
                  skills: skills.text.split(';')
                );
                DatabaseJobVacancy.tambahData(item: data);
                Navigator.pop(context);
              },
              child: Text('Simpan data',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width / 3,
            child: FlatButton(
              textColor: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
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
