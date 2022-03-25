import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_admin/Models/BookingDetails.dart';
import 'package:hotel_admin/ui-screen-admin/admin-upcoming-booking-details-page.dart' as uiscreen;

import 'package:hotel_admin/services/api.dart';

class UpComingbookingDetailsForm extends StatefulWidget {
  final BookingDetails? booking;

  const UpComingbookingDetailsForm({Key? key, @required this.booking})
      : super(key: key);

  @override
  _UpComingbookingDetailsFormState createState() =>
      _UpComingbookingDetailsFormState();
}

class _UpComingbookingDetailsFormState
    extends State<UpComingbookingDetailsForm> {
  bool status = false;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _checkinTimeController = TextEditingController();
  final _checkinController = TextEditingController();
  final _hoursController = TextEditingController();
  final _paymentStatusController = TextEditingController();
  final _paymentController = TextEditingController();
  final _isAcController = TextEditingController();

  @override
  void initState() {
    if (widget != null) {
      _nameController.text = widget.booking?.user_name ?? "";
      _checkinController.text = widget.booking?.checkin_date ?? "";
      _checkinTimeController.text = widget.booking?.checkin_time ?? "";
      _hoursController.text = widget.booking?.num_hours ?? "";
      _paymentStatusController.text = widget.booking?.payment_status ?? "";
      _paymentController.text = widget.booking?.price ?? "";
      _isAcController.text = widget.booking?.is_ac ?? "";

      if (widget.booking?.status != "") {
        setState(() {
          status = false;
        });
      } else {
        setState(() {
          status = true;
        });
      }
    }
    // TODO: implement initState
    super.initState();
  }

  updateBooking(id, flag) {
    print(id);
    Future<bool> response = Api().updateBooking(id, flag);
    response.then((value) => {
          if(value == true)
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => uiscreen.BookingDetails()),
              ),
              Fluttertoast.showToast(
                  msg: "Booking "+ flag,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: flag == 'accepted' ? Color(0xff1f1b51) : Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0)
            }
        });
  }

  buttons() {
    if (status) {
      return [
        ElevatedButton(
          // TODO: implement callback
          onPressed: () {
            updateBooking(widget.booking?.id, "accepted");
          },
          child: Text(
            'Accept Booking',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        ElevatedButton(
          // TODO: implement callback
          onPressed: () {
            updateBooking(widget.booking?.id, "cancelled");

          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: Text(
            'Cancel Booking',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ];
    } else {
      return [Text("")];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(" Bookings Details")),
        backgroundColor: Color(0xff1f1b51),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.blueGrey,
                Colors.white,
          ])),
          child: Column(
            children: [
              Container(
                width: double.infinity,
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
                  child: Image.network(widget.booking?.hotel_images ?? "",
                      fit: BoxFit.cover),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        controller: _nameController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Customer Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        autofocus: false,
                        controller: _hoursController,
                        readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Hours of stay',
                            border: OutlineInputBorder(),
                          ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        autofocus: false,
                        controller: _isAcController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Air Condition',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        autofocus: false,
                        controller: _paymentController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Collectible Amount',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        autofocus: false,
                        controller: _checkinController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Check in',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: buttons(),
                      ),
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
