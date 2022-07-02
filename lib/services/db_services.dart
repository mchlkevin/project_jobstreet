  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_uas/class/appliedclass.dart';
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
    DocumentReference docRef = dataLowongan.doc(item.uid);

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
  static Stream<QuerySnapshot> getsAllDataFromJobVacancy(String uid) {
    if (uid == "") {
      return dataApplied.snapshots();
    } else {
      return dataApplied
          .orderBy("job-vacancy")
          .startAt([uid]).endAt([uid + '\uf8ff']).snapshots();
    }
  }

  

  static Future<bool> doesApplyAlreadyExist(String jobSeekerName, String JobVacancyName) async {
  final QuerySnapshot result = await FirebaseFirestore.instance
    .collection('applied-job')
    .where('job-vacancy', isEqualTo: JobVacancyName).where('job-seeker', isEqualTo: jobSeekerName)
    .limit(1)
    .get();
  
  final List<DocumentSnapshot> documents = result.docs;

  
  return documents.length == 1;
}
  
  static Future<void> tambahData({required appliedclass item}) async {
    DocumentReference docRef = dataApplied.doc(item.uidJobVacancy + item.uidPerson);
    bool a = await doesApplyAlreadyExist(item.uidPerson, item.uidJobVacancy);
    if (a == false){
      await docRef
        .set(item.toJson())
        .whenComplete(() => print("Data berhasil diperbarui"))
        .catchError((e) => print(e));
    }
    
    
    
  }



  static Future<void> ubahData({required appliedclass item}) async {
    DocumentReference docRef = dataApplied.doc(item.uidJobVacancy + item.uidPerson);
    await docRef
    .update(item.toJson())
    .whenComplete(() => print("Data Berhasil Diubah"))
    .catchError((e)=>print(e));
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



