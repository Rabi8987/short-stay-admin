import 'dart:convert';
import 'package:hotel_admin/Models/Home.dart';
import 'package:hotel_admin/Models/HotelDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotel_admin/Models/Booking.dart';
import 'package:hotel_admin/Models/RoomDetails.dart';
import 'package:hotel_admin/Models/Rooms.dart';
import 'package:http/http.dart' as http;

class Api {
  var client = http.Client();
  String base_url = 'https://admin.shortstay.pk';

  Future<bool> addHotel(HotelDetails hotel) async {
    print("api");
    var response = await http.post(Uri.parse(base_url + '/add-hotel'),
        body: jsonEncode({
          'hotel_name':hotel.hotel_name,
          'owner_name':hotel.owner_name,
          'mobile':hotel.owner_mobile,
          'landline':hotel.hotel_landline,
          'owner_cnic':hotel.owner_cnic,
          'address':hotel.hotel_address,
          'password':hotel.password,
          'flag': 'api',
        }),
        headers: {"content-type": "application/json"});
    print(response.body);
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var jsonData = json.decode(response.body);
      prefs.setBool('session', true);
      prefs.setString('unique_prefix', jsonData['data']['unique_prefix']);
      print(jsonData);
      return jsonData['status'];
    } else {
      print("error");
      return false;
    }
  }


  Future<Home> getHotelDetails(String? unique_prefix) async {
    print(unique_prefix);
    var response = await http.get(
        Uri.parse(base_url + '/hotel-details/' + unique_prefix!));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print(jsonData);
      var home = Home.fromJson(jsonData);
      return home;

    } else {
      print(response.body);
      return Home(name: "", count: 0);
    }
  }

  Future<Rooms> getRooms(String unique_prefix) async {
    var response = await http.get(
        Uri.parse(base_url + '/view-rooms/' + unique_prefix + '?flag=api'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var room = Rooms.fromJson(jsonData);
      return room;
    } else {
      print("error");
      return Rooms(status: false, code: 400, data: []);
    }
  }

  Future<Booking> getBooking(String unique_prefix,String status) async {
    var response = await http.get(
        Uri.parse(base_url + '/view-bookings/' + unique_prefix + '?flag=api&status='+status));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var booking = Booking.fromJson(jsonData);
      return booking;
    } else {
      print("error");
      return Booking(status: false, code: 400, data: []);
    }
  }

  Future<bool> editRooms(
      RoomsDetails roomsDetails, String unique_prefix) async {
    print(roomsDetails);
    var response = await http.post(
        Uri.parse(base_url +
            '/edit-room/' +
            unique_prefix +
            '/' +
            roomsDetails.id.toString()),
        body: jsonEncode({
          'room_category': roomsDetails.category,
          'room_capacity': roomsDetails.capacity,
          'room_animites': roomsDetails.animites,
          'price': roomsDetails.price,
          'flag': 'api'
        }),
        headers: {"content-type": "application/json"});
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      return jsonData['status'];
    } else {
      print(response.body);
      return false;
    }
  }

  Future<bool> login(mobile,password) async {
    var response = await http.post(Uri.parse(base_url + '/login'),
        body: jsonEncode({
          'mobile': mobile,
          'password': password,
          'flag': 'api',
        }),
        headers: {"content-type": "application/json"});
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      if(jsonData['status'] == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        print(jsonData['data']['hotel_name']);
        prefs.setBool('session', true);
        prefs.setString('unique_prefix', jsonData['data']['unique_prefix']);
        prefs.setString('hotel_name', jsonData['data']['hotel_name']);
        print(jsonData);
      }
      return jsonData['status'];
    } else {
      print("error");
      return false;
    }
  }

  Future<bool> updateBooking(id,flag) async {
    var response = await http.post(Uri.parse(base_url + '/update-booking'),
        body: jsonEncode({
          'id': id,
          'status': flag,
          'flag': 'api',
        }),
        headers: {"content-type": "application/json"});
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print(jsonData);
      return jsonData['status'];
    } else {
      print("error");
      return false;
    }
  }
}
