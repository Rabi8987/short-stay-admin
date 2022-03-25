import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomerEntry extends StatefulWidget {
  const CustomerEntry({Key? key}) : super(key: key);

  @override
  _CustomerEntryState createState() => _CustomerEntryState();
}

class _CustomerEntryState extends State<CustomerEntry> {
  File? selectedImage;

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path); // won't have any error now
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Add Customer Details")),
        backgroundColor: Color(0xff1f1b51),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.blueGrey,
                    Colors.white,
                  ])),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
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
                                  hintText: 'Customer Name',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
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
                                  hintText: 'Mobile Number',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
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
                                  hintText: 'CNIC Number',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
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
                                  hintText: 'Address',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
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
                                  hintText: 'Total Person',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
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
                                  hintText: 'Room Number',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
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
                                  hintText: 'Check In Number',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            child: TextFormField(
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
                                  hintText: 'Check In Data',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap:getImage,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: Text('Cnic Front Imgae')

                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap:getImage,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Colors.grey))),
                                child: Text('Cnic Back Imgae')

                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      ElevatedButton(
                        // TODO: implement callback
                        onPressed:getImage,
                        child: Text(
                          'Submit Customer Data',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
