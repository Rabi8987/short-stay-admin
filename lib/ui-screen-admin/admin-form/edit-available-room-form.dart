import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_admin/Models/RoomDetails.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiselect/multiselect.dart';
import 'package:http/http.dart' as http;

import '../admin-available-rooms.dart';

class EditRoom extends StatefulWidget {
  final RoomsDetails? rooms;

  const EditRoom({Key? key, required this.rooms}) : super(key: key);

  @override
  _EditRoomState createState() => _EditRoomState();
}

class _EditRoomState extends State<EditRoom> {
  final _formKey = GlobalKey<FormState>();
  final _categoryController = TextEditingController();
  final _capacityController = TextEditingController();
  final _animitiesController = TextEditingController();
  final _priceRoomController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String roomId = "";
  late File selectedImage =
      File('https://admin.shortstay.pk/storage/app/room_images/test.png');

  List<String> selected = [];

  @override
  void initState() {
    // TODO: implement initState
    if (widget != null) {
      _categoryController.text = widget.rooms?.category ?? "";
      _capacityController.text = widget.rooms?.capacity ?? "";
      _animitiesController.text = widget.rooms?.animites ?? "";
      _priceRoomController.text = widget.rooms?.price.toString() ?? "";
      roomId = widget.rooms?.id.toString() ?? "";
    }

    super.initState();
  }

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!.path); // won't have any error now
      print(selectedImage.path);
    });
  }

  updateRoom() async {
    // print("here");return;
    final form = _formKey.currentState;
    form?.save();
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse('https://admin.shortstay.pk/edit-room/cbh762/$roomId'));
      request.fields.addAll({
        'room_category': _categoryController.text,
        'room_capacity': _capacityController.text,
        'room_animities': selected.join(","),
        'price': _priceRoomController.text,
        'flag': 'api'
      });
      print(selectedImage.path);
      if (selectedImage.path !=
          'https://admin.shortstay.pk/storage/app/room_images/test.png') {
        request.files.add(await http.MultipartFile.fromPath(
            'hotel_images', selectedImage.path));
      }
      var response = await request.send();
      var responsed = await http.Response.fromStream(response);
      var jsonData = json.decode(responsed.body);
      if (jsonData["status"] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AvailableRooms()),
        );
        Fluttertoast.showToast(
            msg: "Room Edit",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff1f1b51),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Room Not Edit",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      print(responsed.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Edit Room Details")),
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
            ]),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0)
                ]),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.network(
                        widget.rooms?.image.split(",")[0] ?? "",
                        fit: BoxFit.cover)),
              ),
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
                              controller: _categoryController,
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
                              controller: _capacityController,
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
                                      borderSide: BorderSide(
                                          color: Color(0xff1f1b51)))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 65,
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
                          child: Container(
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
                            onTap: getImage,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: Text(
                                  'Room Image',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xff1f1b51)),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      ElevatedButton(
                        // TODO: implement callback
                        onPressed: () {
                          updateRoom();
                        },
                        child: Text(
                          'Edit Room',
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
