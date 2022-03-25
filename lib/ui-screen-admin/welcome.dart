import 'package:flutter/material.dart';

import 'admin-form/admin-login-page.dart';
import 'admin-hotel-reg-page.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blueGrey,
            Colors.white,
          ]),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(height: 20.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: ElevatedButton(
                    // TODO: implement callback
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                    child: Text(
                      'Register Now',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotelRegister()),
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
