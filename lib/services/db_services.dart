import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_uas/class/companyclass.dart';
import 'package:project_uas/class/seekerclass.dart';

CollectionReference dataSeeker =
    FirebaseFirestore.instance.collection("job-seeker");
CollectionReference dataCompany =
    FirebaseFirestore.instance.collection("company");

class DatabaseSeeker {
  static Stream<QuerySnapshot> getData() {
    return dataSeeker.snapshots();
  }

  static Future<void> tambahData({required classSeeker item}) async {
    DocumentReference docRef = dataSeeker.doc(item.uid);

    await docRef
        .update(item.toJson())
        .whenComplete(() => print("Data berhasil diperbarui"))
        .catchError((e) => print(e));
  }
}

class DatabaseCompany {
  static Stream<QuerySnapshot> getData() {
    return dataCompany.snapshots();
  }

  static Future<void> tambahData({required classCompany item}) async {
    DocumentReference docRef = dataCompany.doc(item.uid);

    await docRef
        .update(item.toJson())
        .whenComplete(() => print("Data berhasil diperbarui"))
        .catchError((e) => print(e));
  }
}
