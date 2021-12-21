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
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(60), topLeft: Radius.circular(60)),
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
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
                      "assets/images/h5.jpg",
                      fit: BoxFit.cover,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Name'),
                        Text('Money'),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Rating'),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Chip(
                                padding: EdgeInsets.all(0),
                                backgroundColor: Color(0xff1f1b51),
                                label: Text('12/1/1',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              Chip(
                                padding: EdgeInsets.all(0),
                                backgroundColor: Color(0xff1f1b51),
                                label: Text('12/2/2',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
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
      ),
    );
  }
}
