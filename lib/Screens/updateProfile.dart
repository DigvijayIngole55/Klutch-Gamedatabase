import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfile({this.user,this.avatarno});
  User user;
  int avatarno;



  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override

  var snap;
  String Username;
  String tag;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  void initState() {
    super.initState();
  }
  void upload()async{
    await firebaseFirestore.collection('User').doc(widget.user.uid).update({'Username': Username,
      'Tag': tag
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0XFF101010),
        appBar: AppBar(
          backgroundColor: Color(0xFF1F1F1F),
          title: Text(
            "Profile",
            style: TextStyle(
                fontFamily: 'mokoto',
                fontWeight: FontWeight.w600,
                fontSize: 20.0),
          ),
          actions: <Widget>[
            GestureDetector(
                onTap: () async{
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => ()));
                },
                child: GestureDetector(
                  onTap: ()async{
                    await upload();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen(user: widget.user,)));
                  },
                  child: Icon(
                    Icons.save,
                    size: 27.0,
                  ),
                )),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 80.0,
              ),
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('avatars/${widget.avatarno}.png',),
                backgroundColor: Color(0XFF292929),
              ),
              SizedBox(
                height: 100.0,
              ),
              TextField(
                onChanged: (value){
                  Username = value;
                },
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: ('Enter new username'),
                  prefixIcon: Icon(Icons.person,
                    color: Colors.black54,),
                  hintStyle: TextStyle(
                    fontFamily: 'Bungee',
                    color: Colors.black54,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextField(
                onChanged: (value){
                  tag = value;
                },
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: ('Enter new tag'),
                  prefixIcon: Icon(Icons.bookmark_border,
                    color: Colors.black54,),
                  hintStyle: TextStyle(
                    fontFamily: 'Bungee',
                    color: Colors.black54,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
