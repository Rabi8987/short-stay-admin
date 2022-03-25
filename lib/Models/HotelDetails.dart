import 'dart:convert';


class HotelDetails{
  int id;
  String hotel_name;
  String hotel_landline;
  String hotel_address;
  String owner_name;
  String owner_cnic;
  String owner_mobile;
  String password;
  String hotel_images;

  HotelDetails({
    required this.id,
    required this.hotel_name,
    required this.hotel_landline,
    required this.hotel_address,
    required this.owner_name,
    required this.owner_cnic,
    required this.owner_mobile,
    required this.password,
    required this.hotel_images
  });

  factory HotelDetails.fromJson(Map<String, dynamic> json) => HotelDetails(
      id:json['id'],
      hotel_name:json['hotel_name'],
      hotel_landline:json['hotel_landline'],
      hotel_address:json['hotel_address'],
      owner_name:json['owner_name'],
      owner_cnic:json['owner_cnic'],
      owner_mobile:json['owner_mobile'],
      password:json['password'],
      hotel_images:json['hotel_images']
  );

  Map<String, dynamic> toJson() => {
    'id':id,
    'hotel_name':hotel_name,
    'hotel_landline':hotel_landline,
    'hotel_address':hotel_address,
    'owner_name':owner_name,
    'owner_cnic':owner_cnic,
    'owner_mobile':owner_mobile,
    'password':password,
    'hotel_images':hotel_images
  };
}