import 'package:flutter/material.dart';

class ContactAboutUs extends StatefulWidget {
  const ContactAboutUs({Key? key}) : super(key: key);

  @override
  _ContactAboutUsState createState() => _ContactAboutUsState();
}

class _ContactAboutUsState extends State<ContactAboutUs> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Contact Us")),
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
                      labelText: 'Phone Number',
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
                      labelText: 'Email Address',
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
                      labelText: 'Address Of Office',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1f1b51)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff1f1b51)))),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,//Normal textInputField will be displayed
                  maxLines: 5,
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
                      labelText: 'About Us',
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
                    'Submit',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );  }
}
