import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_admin/Models/BookingDetails.dart';

class HistoryForm extends StatefulWidget {
  final BookingDetails? booking;
  const HistoryForm({Key? key, @required this.booking}) : super(key: key);

  @override
  _HistoryFormState createState() => _HistoryFormState();
}

class _HistoryFormState extends State<HistoryForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _checkinTimeController = TextEditingController();
  final _checkinController = TextEditingController();
  final _hoursController = TextEditingController();
  final _paymentStatusController = TextEditingController();

  @override
  void initState() {
    if(widget != null) {
      _nameController.text = widget.booking?.user_name ?? "";
      _checkinController.text = widget.booking?.checkin_date ?? "";
      _checkinTimeController.text = widget.booking?.checkin_time??"";
      _hoursController.text = widget.booking?.num_hours??"";
      _paymentStatusController.text = widget.booking?.payment_status??"";
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Booking History Details")),
        backgroundColor: Color(0xff1f1b51),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blueGrey,
            Colors.white,
          ]),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0
                )]
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),),
                child: Image.network(
                    widget.booking?.hotel_images??"",
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 40),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        autofocus: false,
                        controller: _nameController,
                        readOnly: true,

                        decoration: InputDecoration(
                          labelText: 'Customer name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        autofocus: false,
                        controller: _checkinTimeController,
                        readOnly: true,

                        decoration: InputDecoration(
                          labelText: 'Check in time',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        autofocus: false,
                        controller: _checkinController,
                        readOnly: true,

                        decoration: InputDecoration(
                          labelText: 'Check in date',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        autofocus: false,
                        controller: _hoursController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Hours stays',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        autofocus: false,
                        controller: _paymentStatusController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Payment collected',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
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
