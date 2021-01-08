import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Activity extends StatefulWidget {
  Activity({this.user});
  User user;
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List games;
  List gamesimg;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection('User')
        .doc(widget.user.uid)
        .get()
        .then((value) {
      print(value.data());
      setState(() {
        games = value.data()['Activity'];
        gamesimg = value.data()['ActivityImg'];
        print(games);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1F1F1F),
        appBar: AppBar(
          backgroundColor: Color(0xFF1F1F1F),
          title: Text(
            "Activity",
            style: TextStyle(
                fontFamily: 'mokoto',
                fontWeight: FontWeight.w600,
                fontSize: 20.0),
          ),
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  getdata();
                },
                child: Icon(
                  Icons.refresh,
                  size: 30.0,
                )),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
        body: Container(
          color: Color(0XFF101010),
          child: Container(
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Color(0XFF292929),
                borderRadius: BorderRadius.circular(5.0)),
            child: ListView.builder(
              itemCount: games.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                          height: 50,
                          width: 50,
                          child: Image(
                            image: NetworkImage(gamesimg[index]),
                          )),
                      SizedBox(
                        width: 10.0,
                      ),
                      AutoSizeText(
                        '${games[index]}',
                        style: TextStyle(
                            color: Colors.white,),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
