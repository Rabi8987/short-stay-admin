import 'package:flutter/material.dart';
import 'package:hotel_admin/Models/Rooms.dart';
import 'package:hotel_admin/services/api.dart';
import 'package:page_transition/page_transition.dart';

import 'admin-form/add-available-room-form.dart';
import 'admin-form/edit-available-room-form.dart';

class AvailableRooms extends StatefulWidget {
  const AvailableRooms({Key? key}) : super(key: key);

  @override
  _AvailableRoomsState createState() => _AvailableRoomsState();
}

class _AvailableRoomsState extends State<AvailableRooms> {
  late Future<Rooms> rooms;

  @override
  void initState() {
    // TODO: implement initState
    rooms = Api().getRooms("cbh762");
    super.initState();
  }

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
                    PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      duration: Duration(seconds: 1),
                      reverseDuration: Duration(seconds: 1),
                      child: AvailableRoomsForm(),
                    ),
                    // MaterialPageRoute(builder: (context) => AvailableRoomsForm()),
                  );
                },
                child: Icon(Icons.add),
              )),
        ],
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
        child: FutureBuilder<Rooms>(
            future: rooms,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.data.length,
                  itemBuilder: (context, index) {
                    var rooms = snapshot.data?.data[index];
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
                                  child: EditRoom(rooms: rooms),
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
                                    rooms != null ? rooms.category : ""),
                                subtitle: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(rooms != null
                                            ? rooms.capacity
                                            : ""),
                                        Text(rooms != null ? rooms.price
                                            .toString() : ""),
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
