import 'package:flutter/material.dart';
import 'package:hotel_admin/Models/Booking.dart';
import 'package:hotel_admin/services/api.dart';
import 'package:page_transition/page_transition.dart';

import 'admin-form/upcoming-booking-detail-form.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  late Future<Booking> booking;
  @override
  void initState() {
    // TODO: implement initState
    booking = Api().getBooking("cbh762","upcoming");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Up Coming Bookings")),
        backgroundColor: Color(0xff1f1b51),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blueGrey,
            Colors.white,
          ]),
        ),
        child: FutureBuilder<Booking>(
            future: booking,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.data.length,
                  itemBuilder: (context, index) {
                    var bookings = snapshot.data?.data[index];

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.topToBottom,
                                  duration: Duration(seconds: 1),
                                  reverseDuration: Duration(seconds: 1),
                                  child: UpComingbookingDetailsForm(booking: bookings),
                                ),
                                // MaterialPageRoute(builder: (context) => EditRoom()),
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
                                title: Text(
                                    bookings != null ? bookings.hotel_name : ""),
                                subtitle: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(bookings != null
                                            ? bookings.booking_id
                                            : ""),
                                        // Text(bookings != null ? bookings.price
                                        //     .toString() : ""),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.edit),
                                ),
                                isThreeLine: true,
                                dense: true,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
