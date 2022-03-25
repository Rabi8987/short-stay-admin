import 'dart:convert';



class Home{
  Home({
    required this.name,
    required this.count,
  });


  factory Home.fromJson(Map<String, dynamic> json) => Home(
      name: json['name'],
      count: json['count']
  );

  Map<String, dynamic> toJson() => {
    "name":name,
    "count":count
  };

  String name;
  int count;
}

