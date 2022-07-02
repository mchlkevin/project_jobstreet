import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_uas/homescreen.dart';
import 'package:project_uas/hscreencompany.dart';
import 'package:project_uas/mainscreen.dart';
import 'package:project_uas/services/auth_services.dart';
import 'package:project_uas/services/db_services.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

// @dart=2.9
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'Project UAS - Kelompok 24',
        theme: ThemeData(fontFamily: 'Arial'),
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  var x;
  static Future<bool> isThisCompanyAccount(String uid) async{
    final QuerySnapshot result = await FirebaseFirestore.instance
    .collection('company')
    .where('uid', isEqualTo: uid)
    .limit(1)
    .get();
  final List<DocumentSnapshot> documents = result.docs;
  bool boolean = false;
  if (documents.isNotEmpty && documents.length == 1){
    boolean = true;
  }
  return boolean;
  }
  
  Future<Widget> widgetssss() async{
    User? userDetection = FirebaseAuth.instance.currentUser;
    final user = context.watch<User?>();
    if (user == null){
      return MainScreen();
    }
    bool a = await isThisCompanyAccount(userDetection!.uid);
    var x;
    if (user != null && a == true){
      x = HomeScreenCompany();
    }
    else if (user != null && a == false){
      x = HomeScreen();
    }
    else{
      x = MainScreen();
    }
    return x;
  }
  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      body: FutureBuilder(
        future: widgetssss(),
        builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                // Map<String, dynamic> data =
                //     snapshot.data!.data() as Map<String, dynamic>;
                // return Column(children: [
                //   // Text('Welcome ' + data['company-name'],
                //   //     style:
                //   //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                // ]);
                return snapshot.data as Widget;
              }

              return CircularProgressIndicator();
            },),
        );
    // if (user != null &&
    //     userDetection!.email.toString().contains('company') == true) {
          
    //   return HomeScreenCompany();
    // } else if (user != null &&
    //     userDetection!.email.toString().contains('company') == false) {
    //   return HomeScreen();
    // }
    // return MainScreen();

    }
    
    
  }

