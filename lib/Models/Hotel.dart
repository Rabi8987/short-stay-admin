import 'dart:convert';
import 'package:hotel_admin/Models/HotelDetails.dart';



class Hotel{
  Hotel({
    required this.status,
    required this.code,
    required this.data
  });


  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
      status: json['status'],
      code: json['code'],
      data: List<HotelDetails>.from(json['data'].map((x) => HotelDetails.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "status":status,
    "code":code,
    "data":List<dynamic>.from(data.map((e) => e.toJson()))
  };

  bool status;
  int code;
  List<HotelDetails> data;
}

