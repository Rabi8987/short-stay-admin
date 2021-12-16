import 'package:flutter/material.dart';

class HistoryForm extends StatefulWidget {
  const HistoryForm({Key? key}) : super(key: key);

  @override
  _HistoryFormState createState() => _HistoryFormState();
}

class _HistoryFormState extends State<HistoryForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Booking Detials")),
        backgroundColor: Color(0xff1f1b51),
      ),
      body: SingleChildScrollView(
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
                      labelText: 'Check In Time',
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
                      labelText: 'Check In Date',
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
                      labelText: 'Stay Of Hours',
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
                      labelText: 'Payment Collected',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1f1b51)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1f1b51)))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}