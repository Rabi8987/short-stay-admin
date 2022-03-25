import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotel_admin/services/api.dart';
import 'package:hotel_admin/ui-screen-admin/admin-hotel-reg-page.dart';

import '../admin-landing-page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  bool status = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        status = true;
      });
      Future<bool> loginResponse =
          Api().login(_mobileController.text, _passwordController.text);
      loginResponse.then((value) => {
            print(value),
            if (value == true)
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                )
              }
            else
              {
                setState(() {
                  status = false;
                }),
                Fluttertoast.showToast(
                    msg: "Phone or password incorrect",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0)
              }
          });
    }
  }

  screenData() {
    if (status) {
      return Padding(
        padding: const EdgeInsets.all(64.0),
        child: Center(
            child: SpinKitFadingCircle(
          color: Color(0xff1f1b51),
          size: 50.0,
          controller: AnimationController(
              vsync: this, duration: const Duration(milliseconds: 1200)),
        )),
      );
    } else {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blueGrey,
          Colors.white,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height/2.3,
                  child: Image.asset('assets/images/logo.png')),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _mobileController,
                                autofocus: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter mobile number';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _mobileController.text = value!;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.phone_android),
                                  labelText: 'User Mobile',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: Theme.of(context).cursorColor,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                controller: _passwordController,
                                autofocus: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _passwordController.text = value!;
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: 'User Password',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.0),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: ElevatedButton(
                                // TODO: implement callback
                                onPressed: () {
                                  login();
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            GestureDetector(
                                child: Text('Register Now',style: TextStyle(fontSize: 16),),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HotelRegister()),
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenData(),
    );
  }
}
