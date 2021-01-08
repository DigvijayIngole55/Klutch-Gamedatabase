import 'package:flutter/material.dart';
import 'Screens/homeScreen.dart';
import 'Screens/signinScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User user;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void makeuser() {
    user = _firebaseAuth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    makeuser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Attendance Manager",
      home: user == null
          ? SigninScreen()
          : HomeScreen(
        user: user,
      ),
    );
  }
}
