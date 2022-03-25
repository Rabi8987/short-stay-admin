import 'package:flutter/material.dart';
import 'package:hotel_admin/ui-screen-admin/admin_splash_page.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


void main() async {
//Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

// ignore: non_constant_identifier_names
  OneSignal.shared.setAppId("YOUR_ONESIGNAL_APP_ID");

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
// ignore: non_constant_identifier_names
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: ReservationInfo(),
    );
  }


}

