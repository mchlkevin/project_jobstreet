import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<String> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Logged In";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signUpSeeker(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User? user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance
            .collection("job-seeker")
            .doc(user?.uid)
            .set({
          'uid': user?.uid,
          'email': email,
          'password': password,
          'interest-on': ' ',
          'major-in': ' ',
          'domicile': ' ',
          'full-name': ' ',
          'expected-salary': 0,
        });
      });
      return "Signed Up";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signUpCompany(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User? user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance
            .collection("company")
            .doc(user?.uid)
            .set({
          'uid': user?.uid,
          'email': email,
          'password': password,
          'company-name': ' ',
          'company-field': ' ',
          'description': ' ',
          'company-adress': ' '
        });
      });
      return "Signed Up";
    } catch (e) {
      return e.toString();
    }
  }
}
