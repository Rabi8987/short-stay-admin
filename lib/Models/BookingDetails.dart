import 'dart:convert';


class BookingDetails{
  int id;
  String booking_id;
  String unique_prefix;
  int room_id;
  String checkin_date;
  String checkin_time;
  String checkout_date;
  int user_id;
  String user_name;
  String status;
  String num_hours;
  String hotel_name;
  String hotel_images;
  String payment_status;
  String is_ac;
  String price;

  BookingDetails({
    required this.id,
    required this.booking_id,
    required this.unique_prefix,
    required this.room_id,
    required this.checkin_date,
    required this.checkin_time,
    required this.checkout_date,
    required this.user_id,
    required this.user_name,
    required this.status,
    required this.num_hours,
    required this.hotel_name,
    required this.hotel_images,
    required this.payment_status,
    required this.is_ac,
    required this.price
  });

  factory BookingDetails.fromJson(Map<String, dynamic> json) => BookingDetails(
      id:json['id'],
      booking_id:json['booking_id'],
      unique_prefix:json['unique_prefix'],
      room_id:json['room_id'],
      checkin_date:json['checkin_date'],
      checkin_time:json['checkin_time'],
      checkout_date:json['checkout_date'],
      user_id:json['user_id'],
      user_name:json['user_name'],
      status:json['status'],
      hotel_name:json['hotel_name'],
      num_hours:json['num_hours'],
      hotel_images:json['hotel_images'],
      payment_status:json['payment_status'],
      is_ac:json['is_ac'],
      price:json['price']
  );

  Map<String, dynamic> toJson() => {
    'id':id,
    'booking_id':booking_id,
    'unique_prefix':unique_prefix,
    'room_id':room_id,
    'checkin_date':checkin_date,
    'checkin_time':checkin_time,
    'checkout_date':checkout_date,
    'user_id':user_id,
    'user_name':user_name,
    'status':status,
    'num_hours':num_hours,
    'payment_status':payment_status,
    'hotel_name':hotel_name,
    'hotel_images':hotel_images,
    'is_ac':is_ac,
    'price':price
  };
}