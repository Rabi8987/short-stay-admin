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
        title: Center(child: Text(" Add Room Details")),
        backgroundColor: Color(0xff1f1b51),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.black26, Colors.black12, Colors.black26])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                offset: Offset(0,10)
                            )]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey))
                            ),
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
                                  hintText: 'Room Category',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                offset: Offset(0,10)
                            )]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey))
                            ),
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
                                  hintText: 'Room Capacity',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                offset: Offset(0,10)
                            )]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey))
                            ),
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
                                  hintText: 'Room Animities',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: [BoxShadow(
                                color: Colors.black12,
                                blurRadius: 20,
                                offset: Offset(0,10)
                            )]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey))
                            ),
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
                                  hintText: 'Room Image',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff1f1b51)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
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
          ],
        ),
      ),
    );  }
}
