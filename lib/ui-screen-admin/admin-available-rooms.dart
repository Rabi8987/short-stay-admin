import 'package:flutter/material.dart';

import 'admin-form/add-available-room-form.dart';

class AvailableRooms extends StatefulWidget {
  const AvailableRooms({Key? key}) : super(key: key);

  @override
  _AvailableRoomsState createState() => _AvailableRoomsState();
}

class _AvailableRoomsState extends State<AvailableRooms> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Available Rooms")),
        backgroundColor: Color(0xff1f1b51),
        actions: <Widget>[

          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AvailableRoomsForm()),
                  );
                },
                child: Icon(
                    Icons.add
                ),
              )
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AvailableRoomsForm()),
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
                    child: Icon(Icons.edit),
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
