import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class GamePageScreen extends StatefulWidget {
  var gamedata;

  GamePageScreen({this.gamedata});

  @override
  _GamePageScreenState createState() => _GamePageScreenState();
}

class _GamePageScreenState extends State<GamePageScreen> {
  User user;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    user = _firebaseAuth.currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF101010),
      appBar: AppBar(backgroundColor: Color(0xFF1F1F1F)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 50.0,),
            Center(
              child: Container(
                width: 300.0,
                height: 200.0,
                padding: EdgeInsets.all(0.0),
                child: Column(
                  children: <Widget>[
                    Image(image: NetworkImage('${widget.gamedata['background_image']}'),),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            AutoSizeText(
              'Name: ${widget.gamedata['name']}',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontFamily: 'mokoto'),
              maxLines: 1,
            ),
            SizedBox(
              height: 30.0,
            ),
            AutoSizeText(
              'Rating: ${widget.gamedata['rating']}',
              style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.white,
                  fontFamily: 'mokoto'),
              maxLines: 1,
            ),
            SizedBox(
              height: 30.0,
            ),
            AutoSizeText(
              'Developers: ${widget.gamedata['developers'][0]['name']}',
              style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.white,
                  fontFamily: 'mokoto'),
              maxLines: 1,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('Description:',style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: 'mokoto'),),
            SizedBox(
              height: 10.0,
            ),
            AutoSizeText(
              '${widget.gamedata['description_raw']}',
              style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.white,
                  fontFamily: 'mokoto'),
              maxLines: 12,
            ),
            SizedBox(height: 20.0,),
            Container(margin: EdgeInsets.all(5.0),
              height: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: ()async{
                      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                      await firebaseFirestore.collection('User').doc(user.uid).update({'Activity': FieldValue.arrayUnion([widget.gamedata['name']])
                      });
                      await firebaseFirestore.collection('User').doc(user.uid).update({'ActivityImg': FieldValue.arrayUnion([widget.gamedata['background_image']])
                      });
                      },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.orange,
                      child: Text("+ Activity",style: TextStyle(color: Colors.black,fontFamily: 'mokoto'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                      await firebaseFirestore.collection('User').doc(user.uid).update({'Wishlist': FieldValue.arrayUnion([widget.gamedata['name']])
                      });
                      await firebaseFirestore.collection('User').doc(user.uid).update({'WishlistImg': FieldValue.arrayUnion([widget.gamedata['background_image']])
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.lightGreen,
                      child: Text("+ Wishlist ",style: TextStyle(color: Colors.black,fontFamily: 'mokoto'),
                    ),
                    ),
                  ),
                ],
              ))
          ],
        ),
      ),
    );
  }
}

