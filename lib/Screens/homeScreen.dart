import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'searchScreen.dart';
import 'profileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homeScreen.dart';
import 'AcitivityPage.dart';
import 'WishPage.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.user});
  User user;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String Username = 'Username';
  String tag = 'Tag';
  int selected = 1;
  String def = 'https://www.pngitem.com/pimgs/m/359-3599216_894-x-894-d-pad-nintendo-ds-hd.png';
  String Act1;
  String Act2;
  String Act3;
  String Act4;
  String Act5;
  String wish1;
  String wish2;
  String wish3;
  String wish4;
  String wish5;
  @override
  void initState() {
    super.initState();
    getdata();
    getdata2();
    putdata();
  }
  void getdata(){
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      firebaseFirestore.collection('User').doc(widget.user.uid).get().then((value) {
        print(value.data());
        Username = value.data()['Username'];
        tag = value.data()['Tag'];
        selected = value.data()['Avatar'];
        setState(() {
          Act1 = value.data()['ActivityImg'][0];
          Act2 = value.data()['ActivityImg'][1];
          Act3 = value.data()['ActivityImg'][2];
          Act4 = value.data()['ActivityImg'][3];
          Act5 = value.data()['ActivityImg'][4];
        });
    });
    }
  void getdata2(){
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore.collection('User').doc(widget.user.uid).get().then((value) {
      print(value.data());
      setState(() {
        wish1 = value.data()['WishlistImg'][0];
        wish2 = value.data()['WishlistImg'][1];
        wish3 = value.data()['WishlistImg'][2];
        wish4 = value.data()['WishlistImg'][3];
        wish5 = value.data()['WishlistImg'][4];
      });
    });
  }
    void putdata()async{
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      await firebaseFirestore.collection('User').doc(widget.user.uid).update({'Activity': FieldValue.arrayUnion([])
      });
      await firebaseFirestore.collection('User').doc(widget.user.uid).update({'Wishlist': FieldValue.arrayUnion([])
      });
      await firebaseFirestore.collection('User').doc(widget.user.uid).update({'ActivityImg': FieldValue.arrayUnion([])
      });
      await firebaseFirestore.collection('User').doc(widget.user.uid).update({'WishlistImg': FieldValue.arrayUnion([])
      });
      setState(() {

      });
    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1F1F1F),
        drawer: Drawer(
          child: Container(
            color: Color(0xFF1F1F1F),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  color: Color(0xFF1F1F1F),
                  child: Image.asset('images/Klutch1.png'),
                  height: 100.0,
                ),
                Divider(
                  color: Colors.white,
                ),
                SizedBox(
                  height: 40.0,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Activity(user: widget.user,)));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'My Activity',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'mokoto',
                          fontSize: 17.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Wishlist(user: widget.user,)));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Wishlist',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'mokoto',
                          fontSize: 17.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                // GestureDetector(
                //   onTap: (){Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => ProfileScreen()));},
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 20.0),
                //     child: Text(
                //       'Profile',
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontFamily: 'mokoto',
                //           fontSize: 17.0),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF1F1F1F),
          title: Text(
            "KLUTCH",
            style: TextStyle(
                fontFamily: 'mokoto',
                fontWeight: FontWeight.w600,
                fontSize: 22.0),
          ),
          actions: <Widget>[
            GestureDetector(
                onTap: () {
                  getdata();
                  getdata2();
                },
                child: Icon(
                  Icons.refresh,
                  size: 30.0,
                )),
            SizedBox(
              width: 10.0,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                child: Icon(
                  Icons.search,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage('avatars/$selected.png',),
                      backgroundColor: Color(0XFF292929),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                AutoSizeText(
                  '$Username#$tag',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'mokoto'),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 40.0,
                ),
                AutoSizeText(
                  'My Activity',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: 'mokoto'),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 100.0,
                  padding: EdgeInsets.all(5.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.all(0.0),
                        color: Colors.black,
                        width: 90.0,
                        child: Image(image: NetworkImage(Act1 == null?def:Act1),)
                      ),
                      Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Image(image: NetworkImage(Act2 == null?def:Act2),)
                      ),
                      Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Image(image: NetworkImage(Act3 == null?def:Act3),)
                      ),
                      Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Image(image: NetworkImage(Act4 == null? def:Act4),)
                      ),
                      Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Image(image: NetworkImage(Act5 == null?def:Act5),)
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Activity(user: widget.user,)));
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(5.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Center(child: Text('See More',style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                AutoSizeText(
                  'Wishlist',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontFamily: 'mokoto'),
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 100.0,
                  padding: EdgeInsets.all(5.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Image(image: NetworkImage(wish1 == null?def:wish1),)
                      ),
                      Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Image(image: NetworkImage(wish2 == null?def:wish2),)
                      ),
                      Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Image(image: NetworkImage(wish3 == null?def:wish3),)
                      ),
                      Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Image(image: NetworkImage(wish4 == null? def:wish4),)
                      ),
                      Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(0.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Image(image: NetworkImage(wish5 == null?def:wish5),)
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Wishlist(user: widget.user,)));
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(5.0),
                          color: Colors.black,
                          width: 90.0,
                          child: Center(child: Text('See More',style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
