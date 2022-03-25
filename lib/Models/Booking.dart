import 'dart:convert';

import 'package:hotel_admin/Models/BookingDetails.dart';



class Booking{
  Booking({
    required this.status,
    required this.code,
    required this.data
  });


  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
      status: json['status'],
      code: json['code'],
      data: List<BookingDetails>.from(json['data'].map((x) => BookingDetails.fromJson(x)))
  );

  Map<String, dynamic> toJson() => {
    "status":status,
    "code":code,
    "data":List<dynamic>.from(data.map((e) => e.toJson()))
  };

  bool status;
  int code;
  List<BookingDetails> data;
}

