import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_admin/ui-screen-admin/admin-available-rooms.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:http/http.dart' as http;

class AvailableRoomsForm extends StatefulWidget {
  const AvailableRoomsForm({Key? key}) : super(key: key);

  @override
  _AvailableRoomsFormState createState() => _AvailableRoomsFormState();
}

class _AvailableRoomsFormState extends State<AvailableRoomsForm> {
  late File selectedImage;
  List<String> selected = [];

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path); // won't have any error now
      print(selectedImage.path);
    });
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _capacityController = TextEditingController();
  TextEditingController _animitiesController = TextEditingController();
  TextEditingController _priceRoomController = TextEditingController();

  addRoom() async {
    final form = _formKey.currentState;
    form?.save();

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://admin.shortstay.pk/add-room/cbh762'));
      request.fields.addAll({
        'room_category': _categoryController.text,
        'room_capacity': _capacityController.text,
        'room_animities': selected.join(","),
        'price': _priceRoomController.text,
        'flag': 'api'
      });

      request.files.add(await http.MultipartFile.fromPath(
          'hotel_images', selectedImage.path));
      var response = await request.send();
      var responsed = await http.Response.fromStream(response);
      var jsonData = json.decode(responsed.body);
      if (jsonData["status"] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AvailableRooms()),
        );
        Fluttertoast.showToast(
            msg: "Room Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff1f1b51),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Room Not Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      print(jsonData["status"]);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Add Room Details")),
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
                        controller: _categoryController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Room Category';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _categoryController.text = value!;
                        },
                        decoration: InputDecoration(
                          labelText: 'Room Category',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        controller: _capacityController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Room Capacity';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _capacityController.text = value!;
                        },
                        decoration: InputDecoration(
                          labelText: 'Room Capacity',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(
                        child: DropDownMultiSelect(
                          onChanged: (List<String> x) {
                            setState(() {
                              selected = x;
                            });
                          },
                          options: ['A/C', 'Wifi', 'Room Service'],
                          selectedValues: selected,
                          whenEmpty: 'Select Animities',
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        controller: _priceRoomController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Room Price';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _priceRoomController.text = value!;
                        },
                        decoration: InputDecoration(
                          labelText: 'Room Price',
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
                            "Room Image",
                            style: TextStyle(color: Color(0xff1f1b51)),
                          ),
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
                              addRoom();
                            }
                          },
                          child: Text(
                            'Add Room',
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
    );
  }
}
