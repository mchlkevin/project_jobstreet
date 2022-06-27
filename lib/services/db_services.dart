import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_uas/class/companyclass.dart';
import 'package:project_uas/class/seekerclass.dart';

CollectionReference dataSeeker =
    FirebaseFirestore.instance.collection("job-seeker");
CollectionReference dataCompany =
    FirebaseFirestore.instance.collection("company");

class DatabaseSeeker {
  static Future<DocumentSnapshot<Object?>> getData(String uid) {
    return dataSeeker.doc(uid).get();
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
  static Future<DocumentSnapshot<Object?>> getData(String uid) {
    return dataCompany.doc(uid).get();
  }

  static Stream<QuerySnapshot> getsAllData(String companyName) {
    if (companyName == "") {
      return dataCompany.snapshots();
    } else {
      return dataCompany
          .orderBy("company-name")
          .startAt([companyName]).endAt([companyName + '\uf8ff']).snapshots();
    }
  }

  static Future<void> tambahData({required classCompany item}) async {
    DocumentReference docRef = dataCompany.doc(item.uid);

    await docRef
        .update(item.toJson())
        .whenComplete(() => print("Data berhasil diperbarui"))
        .catchError((e) => print(e));
  }
}
