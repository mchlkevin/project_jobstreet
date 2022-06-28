  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_uas/class/companyclass.dart';
import 'package:project_uas/class/seekerclass.dart';
import 'package:project_uas/class/vacancyclass.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

CollectionReference dataSeeker =
    FirebaseFirestore.instance.collection("job-seeker");
CollectionReference dataCompany =
    FirebaseFirestore.instance.collection("company");
CollectionReference dataLowongan =
    FirebaseFirestore.instance.collection("job-vacancy");
CollectionReference dataApplied =
    FirebaseFirestore.instance.collection("applied-job");


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



class DatabaseJobVacancy {
  static Future<DocumentSnapshot<Object?>> getData(String uid) {
    return dataLowongan.doc(uid).get();
  }

  static Stream<QuerySnapshot> getsAllData(String companyName) {
    if (companyName == "") {
      return dataLowongan.snapshots();
    } else {
      return dataLowongan
          .orderBy("company-name")
          .startAt([companyName]).endAt([companyName + '\uf8ff']).snapshots();
    }
  }

  static Future<void> tambahData({required classvacancy item}) async {
    DocumentReference docRef = dataLowongan.doc();

    await docRef
        .set(item.toJson())
        .whenComplete(() => print("Data berhasil diperbarui"))
        .catchError((e) => print(e));
  }

  
}

class DatabaseAppliedJobVacancy {
  static Future<DocumentSnapshot<Object?>> getData(String uid) {
    return dataApplied.doc(uid).get();
  }

  static Stream<QuerySnapshot> getsAllData(String uid) {
    if (uid == "") {
      return dataApplied.snapshots();
    } else {
      return dataApplied
          .orderBy("job-seeker")
          .startAt([uid]).endAt([uid + '\uf8ff']).snapshots();
    }
  }

  
  static Future<void> tambahData({required classvacancy item}) async {
    DocumentReference docRef = dataApplied.doc(item.uid);
    
    await docRef
        .set(item.toJson())
        .whenComplete(() => print("Data berhasil diperbarui"))
        .catchError((e) => print(e));
  }

  
}

// T? tryCast<T>(value) {
//   return value == null ? null : value as T;
// }

// class DocumentReferenceJsonConverter
//     implements JsonConverter<DocumentReference?, Object?> {
//   const DocumentReferenceJsonConverter();

//   @override
//   DocumentReference? fromJson(Object? json) {
//     return tryCast<DocumentReference>(json);
//   }

//   @override
//   Object? toJson(DocumentReference? documentReference) => documentReference;
// }



