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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.blueGrey,
                Colors.white,
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Phone Number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                        },
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autofocus: false,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                        },
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        autofocus: false,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Office Address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                        },
                        decoration: InputDecoration(
                          labelText: 'Office address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter About Us';
                          }
                          return null;
                        },
                        onSaved: (value) {
                        },
                        decoration: InputDecoration(
                          labelText: 'About us',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1,
                        child: ElevatedButton(
                          // TODO: implement callback
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
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
    );  }
}
