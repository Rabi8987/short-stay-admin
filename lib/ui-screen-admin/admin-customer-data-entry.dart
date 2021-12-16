import 'package:flutter/material.dart';

class CustomerEntry extends StatefulWidget {
  const CustomerEntry({Key? key}) : super(key: key);

  @override
  _CustomerEntryState createState() => _CustomerEntryState();
}

class _CustomerEntryState extends State<CustomerEntry> {
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
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
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
                      labelText: 'Mobile number',
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
                      labelText: 'Cnic Number',
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
                  minLines: 1,
                  //Normal textInputField will be displayed
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
                      labelText: 'Address',
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
                      labelText: 'Total Person',
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
                      labelText: 'Room Number',
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
                      labelText: 'Cnic Picture Front',
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
                      labelText: 'Cnic Picture Back',
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
