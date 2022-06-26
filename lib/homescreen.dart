import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          FloatingActionButton.extended(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            label: const Text('Sign Out'),
            icon: const Icon(Icons.leave_bags_at_home),
            backgroundColor: Colors.pink,
          ),
        ]),
      ),
    );
  }
}
