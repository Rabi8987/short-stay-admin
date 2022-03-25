import 'package:flutter/material.dart';
import 'package:hotel_admin/ui-screen-admin/admin-landing-page.dart';
import 'package:hotel_admin/ui-screen-admin/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'admin-form/admin-login-page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    var session;
    getSession().then((value) => session = value);

    Timer(
        Duration(seconds: 4),
            () =>
            {
              if(session == true){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LandingPage()))
              }else
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Welcome()))
                }
            });
  }

  Future<bool?> getSession()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('session');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
