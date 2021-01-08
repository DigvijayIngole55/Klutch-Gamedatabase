import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'updateProfile.dart';
import 'package:firebase_auth/firebase_auth.dart';
class SelectAvatar extends StatefulWidget {
  SelectAvatar({this.user});
  User user;
  @override
  _SelectAvatarState createState() => _SelectAvatarState();
}

class _SelectAvatarState extends State<SelectAvatar> {
  int imageno;
  int selected;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1F1F1F),
          title: Text(
            "Choose Avatar",
            style: TextStyle(
                fontFamily: 'mokoto',
                fontWeight: FontWeight.w600,
                fontSize: 18.0),
          ),
          actions: <Widget>[
            GestureDetector(
                onTap: () async{
                  await firebaseFirestore.collection('User').doc(widget.user.uid).set({"Avatar": selected});
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateProfile(user: widget.user,avatarno: selected,)));},
                child: Icon(
                  Icons.check,
                  size: 30.0,
                )),
            SizedBox(
              width: 10.0,
            )
          ],
        ),
        body: Container(
          color: Color(0XFF101010),
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 1;
                            setState(() {});
                          },
                          child: Image.asset(
                            'avatars/1.png',
                            color: selected == 1 ? Colors.grey : null,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 2;
                            setState(() {});
                          },
                          child: Image.asset('avatars/2.png',
                              color: selected == 2 ? Colors.grey : null)),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 3;
                            setState(() {});
                          },
                          child: Image.asset('avatars/3.png',
                              color: selected == 3 ? Colors.grey : null)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 4;
                            setState(() {});
                          },
                          child: Image.asset(
                            'avatars/4.png',
                            color: selected == 4 ? Colors.grey : null,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 5;
                            setState(() {});
                          },
                          child: Image.asset('avatars/5.png',
                              color: selected == 5 ? Colors.grey : null)),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 6;
                            setState(() {});
                          },
                          child: Image.asset('avatars/6.png',
                              color: selected == 6? Colors.grey : null)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 7;
                            setState(() {});
                          },
                          child: Image.asset(
                            'avatars/7.png',
                            color: selected == 7 ? Colors.grey : null,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 8;
                            setState(() {});
                          },
                          child: Image.asset('avatars/8.png',
                              color: selected == 8 ? Colors.grey : null)),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 9;
                            setState(() {});
                          },
                          child: Image.asset('avatars/3.png',
                              color: selected == 9 ? Colors.grey : null)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 10;
                            setState(() {});
                          },
                          child: Image.asset(
                            'avatars/10.png',
                            color: selected == 10 ? Colors.grey : null,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 11;
                            setState(() {});
                          },
                          child: Image.asset('avatars/11.png',
                              color: selected == 11 ? Colors.grey : null)),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 12;
                            setState(() {});
                          },
                          child: Image.asset('avatars/12.png',
                              color: selected == 12 ? Colors.grey : null)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 13;
                            setState(() {});
                          },
                          child: Image.asset(
                            'avatars/13.png',
                            color: selected == 13 ? Colors.grey : null,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 14;
                            setState(() {});
                          },
                          child: Image.asset('avatars/14.png',
                              color: selected == 14 ? Colors.grey : null)),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 15;
                            setState(() {});
                          },
                          child: Image.asset('avatars/15.png',
                              color: selected == 15 ? Colors.grey : null)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 16;
                            setState(() {});
                          },
                          child: Image.asset(
                            'avatars/16.png',
                            color: selected == 16 ? Colors.grey : null,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 17;
                            setState(() {});
                          },
                          child: Image.asset('avatars/17.png',
                              color: selected == 17 ? Colors.grey : null)),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 18;
                            setState(() {});
                          },
                          child: Image.asset('avatars/18.png',
                              color: selected == 18 ? Colors.grey : null)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 19;
                            setState(() {});
                          },
                          child: Image.asset(
                            'avatars/19.png',
                            color: selected == 19 ? Colors.grey : null,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 20;
                            setState(() {});
                          },
                          child: Image.asset('avatars/20.png',
                              color: selected == 20 ? Colors.grey : null)),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 21;
                            setState(() {});
                          },
                          child: Image.asset('avatars/21.png',
                              color: selected == 21 ? Colors.grey : null)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 22;
                            setState(() {});
                          },
                          child: Image.asset(
                            'avatars/22.png',
                            color: selected == 22 ? Colors.grey : null,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 23;
                            setState(() {});
                          },
                          child: Image.asset('avatars/23.png',
                              color: selected == 23 ? Colors.grey : null)),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 24;
                            setState(() {});
                          },
                          child: Image.asset('avatars/24.png',
                              color: selected == 24 ? Colors.grey : null)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 25;
                            setState(() {});
                          },
                          child: Image.asset(
                            'avatars/25.png',
                            color: selected == 25 ? Colors.grey : null,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 26;
                            setState(() {});
                          },
                          child: Image.asset('avatars/26.png',
                              color: selected == 26 ? Colors.grey : null)),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 27;
                            setState(() {});
                          },
                          child: Image.asset('avatars/27.png',
                              color: selected == 27 ? Colors.grey : null)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 28;
                            setState(() {});
                          },
                          child: Image.asset(
                            'avatars/28.png',
                            color: selected == 28 ? Colors.grey : null,
                          )),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 29;
                            setState(() {});
                          },
                          child: Image.asset('avatars/29.png',
                              color: selected == 29 ? Colors.grey : null)),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            selected = 30;
                            setState(() {});
                          },
                          child: Image.asset('avatars/30.png',
                              color: selected == 30 ? Colors.grey : null)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

