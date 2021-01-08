import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:klutch/Screens/homeScreen.dart';
import 'selectAvatar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User user;
  bool showSpinner = false;

  Future<void> googlesignIn() async {
    final GoogleSignInAccount googleSignInAccount =
    await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    setState(() {
      bool showSpinner = true;
    });
    final UserCredential userCredential =
    await _firebaseAuth.signInWithCredential(authCredential);
    user = userCredential.user;
  }
  void push() {
    showSpinner = false;
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => SelectAvatar(user: user)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F),
      body: Container(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 130.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/Klutch.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(70.0),
                child: GestureDetector(
                  onTap: ()async{
                    await googlesignIn();
                    await push();
                  },
                  child: Image.asset('images/google.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
