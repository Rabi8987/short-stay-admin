import 'package:flutter/cupertino.dart';
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0
              )]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
              child: Image(
                image: AssetImage('assets/images/h3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                                hintText: 'Customer Name',
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
                                hintText: 'Check In Time',
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
                                hintText: 'Check In Date',
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
                                hintText: 'Stay Of Hours',
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
                                hintText: 'Payment Collected',
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
