// ignore_for_file: dead_code

import 'package:flutter/material.dart';

import 'admin-form/booking-history-form.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Booking History")),
        backgroundColor: Color(0xff1f1b51),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryForm()),
                );
              },
              child: Card(
                elevation: 6, // Change this
                shadowColor: Colors.black26,
                child: ListTile(
                  leading: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  ),
                  title: Text('User name'),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('check in date'),
                          Text('check out date'),
                        ],
                      ),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                  isThreeLine: true,
                  dense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
