import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_admin/Models/Home.dart';
import 'package:hotel_admin/services/api.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'admin-available-rooms.dart';
import 'admin-booking-history.dart';
import 'admin-upcoming-booking-details-page.dart';
import 'admin-contact-about-us-page.dart';
import 'welcome.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  var size, height, width;
  late String hotel_name = "";
  late String count = "0";
  DateTime timeBackPressed = DateTime.now();


  @override
  void initState() {
    print("here");
    setState(() {});
    getData();
    // TODO: implement initState
    super.initState();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    getData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    getData();
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    hotel_name = prefs.getString("hotel_name") ?? "Hotel Admin";
    Future<Home> data = Api().getHotelDetails(prefs.getString('unique_prefix'));
    setState(() {});
    data.then((value) => {print(value.name), count = value.count.toString()});
  }

  void handleClick(String value) async {
    switch (value) {
      case 'Logout':
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Welcome()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SmartRefresher(
      enablePullDown: true,
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: WillPopScope(
        onWillPop: () async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= Duration(seconds: 2);

          if (isExitWarning) {
            final message = 'Press back to exit';
            Fluttertoast.showToast(msg: message, fontSize: 16);
            return false;
          } else {
            Fluttertoast.cancel();
            return true;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text(hotel_name)),
            backgroundColor: Color(0xff1f1b51),
            // actions: <Widget>[
            //   PopupMenuButton<String>(
            //     onSelected: handleClick,
            //     itemBuilder: (BuildContext context) {
            //       return {'Logout'}.map((String choice) {
            //         return PopupMenuItem<String>(
            //           value: choice,
            //           child: Text(choice),
            //         );
            //       }).toList();
            //     },
            //   ),
            // ],
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.blueGrey,
                  Colors.white,
                ]),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.only(top: 40, left: 24, right: 24),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: AvailableRooms(),
                                type: PageTransitionType.leftToRight,
                                reverseDuration: Duration(seconds: 1),
                              ),
                              // MaterialPageRoute(
                              //     builder: (context) => AvailableRooms()),
                            );
                          },
                          child: Card(
                            color: Colors.pinkAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.door_back_door_outlined,
                                  color: Colors.white,
                                  size: 64,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Available Rooms',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                reverseDuration: Duration(seconds: 1),
                                child: BookingDetails(),
                              ),
                            );
                          },
                          child: Card(
                            color: Colors.deepPurple,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upcoming,
                                  color: Colors.white,
                                  size: 64,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Upcoming Bookings Details',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.payment_outlined,
                                  color: Colors.white,
                                  size: 64,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Payments',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.leftToRight,
                                reverseDuration: Duration(seconds: 1),
                                child: BookingHistory(),
                              ),
                              // MaterialPageRoute(
                              //     builder: (context) => BookingHistory()),
                            );
                          },
                          child: Card(
                            color: Colors.lightBlueAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.history,
                                  color: Colors.white,
                                  size: 64,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Booking History',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                duration: Duration(seconds: 1),
                                reverseDuration: Duration(seconds: 1),
                                child: ContactAboutUs(),
                              ),
                              // MaterialPageRoute(
                              //     builder: (context) => ContactAboutUs()),
                            );
                          },
                          child: Card(
                            color: Colors.deepPurpleAccent,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.contact_mail,
                                  color: Colors.white,
                                  size: 64,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Contact Us',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                                Text(
                                  'About Us',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            handleClick('Logout');
                          },
                          child: Card(
                            color: Colors.deepOrange,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.login_outlined,
                                  color: Colors.white,
                                  size: 64,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Log out',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Zain Hussain"),
                  accountEmail: Text("zainhussain@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      "Z",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.door_back_door_outlined),
                  title: Text("Available Rooms"),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: AvailableRooms(),
                        type: PageTransitionType.leftToRight,
                        reverseDuration: Duration(seconds: 1),
                      ),
                      // MaterialPageRoute(
                      //     builder: (context) => AvailableRooms()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.upcoming),
                  title: Text("Upcoming Booking Details"),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: BookingDetails(),
                        type: PageTransitionType.leftToRight,
                        reverseDuration: Duration(seconds: 1),
                      ),
                      // MaterialPageRoute(
                      //     builder: (context) => AvailableRooms()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.payment_outlined),
                  title: Text("Payment"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text("Booking History"),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: BookingHistory(),
                        type: PageTransitionType.leftToRight,
                        reverseDuration: Duration(seconds: 1),
                      ),
                      // MaterialPageRoute(
                      //     builder: (context) => AvailableRooms()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text("About Us"),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: ContactAboutUs(),
                        type: PageTransitionType.leftToRight,
                        reverseDuration: Duration(seconds: 1),
                      ),
                      // MaterialPageRoute(
                      //     builder: (context) => AvailableRooms()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.login_outlined),
                  title: Text("Logout"),
                  onTap: () {
                    handleClick("Logout");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
