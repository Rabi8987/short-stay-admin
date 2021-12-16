import 'package:flutter/material.dart';

class AvailableRoomsForm extends StatefulWidget {
  const AvailableRoomsForm({Key? key}) : super(key: key);

  @override
  _AvailableRoomsFormState createState() => _AvailableRoomsFormState();
}

class _AvailableRoomsFormState extends State<AvailableRoomsForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Available Rooms")),
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
                      labelText: 'Room Category ',
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
                      labelText: 'Room Capacity ',
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
                      labelText: 'Room Animities ',
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
                      labelText: 'Room Images ',
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
                    'Add Room',
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
