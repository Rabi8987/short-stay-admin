import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hotel_admin/Models/HotelDetails.dart';
import 'package:hotel_admin/services/api.dart';
import 'admin-form/admin-login-page.dart';
import 'admin-landing-page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class HotelRegister extends StatefulWidget {
  const HotelRegister({Key? key}) : super(key: key);

  @override
  _HotelRegisterState createState() => _HotelRegisterState();
}

class _HotelRegisterState extends State<HotelRegister> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _hotelNameController = TextEditingController();
  TextEditingController _hotelLandLineController = TextEditingController();
  TextEditingController _hotelAddressController = TextEditingController();
  TextEditingController _hotelOwnerNameController = TextEditingController();
  TextEditingController _hotelOwnerNicController = TextEditingController();
  TextEditingController _hotelOwnerNumberController = TextEditingController();
  TextEditingController _hotelPasswordController = TextEditingController();
  TextEditingController _hotelConfirmPasswordController =
      TextEditingController();
  late List<XFile> image;
  

  Future getImage() async {
    image = (await ImagePicker()
        .pickMultiImage(imageQuality: 100, maxWidth: 121440))!;
  }

  addHotel() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        var request = http.MultipartRequest(
            'POST', Uri.parse('https://admin.shortstay.pk/add-hotel'));
        request.fields.addAll({
          'hotel_name': _hotelNameController.text,
          'owner_name': _hotelOwnerNameController.text,
          'mobile': _hotelOwnerNumberController.text,
          'landline': _hotelLandLineController.text,
          'owner_cnic': _hotelOwnerNicController.text,
          'address': _hotelAddressController.text,
          'password': _hotelPasswordController.text,
          'flag': 'api'
        });

        List<http.MultipartFile> newList = [];

        for (var img in image) {
          var multipartFile =
              await http.MultipartFile.fromPath('hotel_images[]', img.path);
          print(multipartFile);
          print(img.path);
          newList.add(multipartFile);
        }
        request.files.addAll(newList);
        var response = await request.send();
        var responsed = await http.Response.fromStream(response);
        print(responsed.body);
        var jsonData = jsonDecode(responsed.body);
        if (jsonData['status'] == true) {
          Navigator.pop(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Form Of Hotel")),
        backgroundColor: Color(0xff1f1b51),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blueGrey,
            Colors.white,
          ])),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _hotelNameController,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _hotelNameController.text = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Hotel name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _hotelLandLineController,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _hotelLandLineController.text = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Hotel landline',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    controller: _hotelAddressController,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _hotelAddressController.text = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'hotel address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _hotelOwnerNameController,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _hotelOwnerNameController.text = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Owner name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _hotelOwnerNicController,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter NIC';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _hotelOwnerNicController.text = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Owner NIC',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _hotelOwnerNumberController,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _hotelOwnerNumberController.text = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Owner mobile number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: _hotelPasswordController,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _hotelPasswordController.text = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: _hotelConfirmPasswordController,
                    autofocus: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter confirm password';
                      }
                      if (value != _hotelPasswordController.text) {
                        return 'Password does not match';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _hotelConfirmPasswordController.text = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm passowrd',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    child: OutlinedButton.icon(
                      onPressed: getImage,
                      icon: Icon(Icons.add, size: 18),
                      label: Text(
                        "Hotel Image",
                        style: TextStyle(color: Color(0xff1f1b51)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1,
                    child: ElevatedButton(
                      // TODO: implement callback
                      onPressed: () {
                        addHotel();
                      },
                      child: Text(
                        'Register Hotel',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
