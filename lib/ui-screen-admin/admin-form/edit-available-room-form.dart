import 'package:flutter/material.dart';


class EditRoom extends StatefulWidget {
  const EditRoom({Key? key}) : super(key: key);

  @override
  _EditRoomState createState() => _EditRoomState();
}

class _EditRoomState extends State<EditRoom> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Edit Room Details")),
        backgroundColor: Color(0xff1f1b51),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.black26, Colors.black12, Colors.black38])),
        child: Column(
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
            ),            ],
        ),
      ),
    );
  }
}
