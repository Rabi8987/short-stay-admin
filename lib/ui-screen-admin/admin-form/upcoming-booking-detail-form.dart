import 'package:flutter/material.dart';

class UpComingbookingDetailsForm extends StatefulWidget {
  const UpComingbookingDetailsForm({Key? key}) : super(key: key);

  @override
  _UpComingbookingDetailsFormState createState() => _UpComingbookingDetailsFormState();
}

class _UpComingbookingDetailsFormState extends State<UpComingbookingDetailsForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Up Coming Booking Details")),
        backgroundColor: Color(0xff1f1b51),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 32),
            child: Column(
              children: [
                TextFormField(
                  autofocus: false,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'Please Enter Full Name';
                  //   }
                  //   return null;
                  // },
                  // onSaved: (value) {
                  //   name = value;
                  // },
                  decoration: InputDecoration(
                      labelText: 'Customer Name',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1f1b51)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1f1b51)))),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  autofocus: false,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'Please Enter Full Name';
                  //   }
                  //   return null;
                  // },
                  // onSaved: (value) {
                  //   name = value;
                  // },
                  decoration: InputDecoration(
                      labelText: 'Booking Time',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1f1b51)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1f1b51)))),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  autofocus: false,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'Please Enter Full Name';
                  //   }
                  //   return null;
                  // },
                  // onSaved: (value) {
                  //   name = value;
                  // },
                  decoration: InputDecoration(
                      labelText: 'Hours Of Stay',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1f1b51)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1f1b51)))),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  autofocus: false,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'Please Enter Full Name';
                  //   }
                  //   return null;
                  // },
                  // onSaved: (value) {
                  //   name = value;
                  // },
                  decoration: InputDecoration(
                      labelText: 'Booking Date',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1f1b51)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1f1b51)))),
                ),
                TextFormField(
                  autofocus: false,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'Please Enter Full Name';
                  //   }
                  //   return null;
                  // },
                  // onSaved: (value) {
                  //   name = value;
                  // },
                  decoration: InputDecoration(
                      labelText: 'A/C on or off',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1f1b51)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1f1b51)))),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  autofocus: false,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'Please Enter Full Name';
                  //   }
                  //   return null;
                  // },
                  // onSaved: (value) {
                  //   name = value;
                  // },
                  decoration: InputDecoration(
                      labelText: 'Collecting Amount',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1f1b51)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1f1b51)))),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  autofocus: false,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'Please Enter Full Name';
                  //   }
                  //   return null;
                  // },
                  // onSaved: (value) {
                  //   name = value;
                  // },
                  decoration: InputDecoration(
                      labelText: 'check In',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1f1b51)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1f1b51)))),
                ),
                SizedBox(height: 40.0),

                ElevatedButton(
                  // TODO: implement callback
                  onPressed: () {},
                  child: Text(
                    'Accept Booking',
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
