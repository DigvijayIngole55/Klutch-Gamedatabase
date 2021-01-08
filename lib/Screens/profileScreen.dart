import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'updateProfile.dart';
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateProfile()));
                },
                child: Icon(
                  Icons.edit,
                  size: 27.0,
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
                backgroundImage: AssetImage('avatars/18.png',),
                backgroundColor: Color(0XFF292929),
              ),
              SizedBox(
                height: 100.0,
              ),
              AutoSizeText(
                'Name: BLOODYPAIN55',
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
                'Tag: #4567',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: 'mokoto'),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
