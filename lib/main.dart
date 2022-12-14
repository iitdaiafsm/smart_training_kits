import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_training_kits/helper/firebase_helper.dart';
import 'package:smart_training_kits/screens/main/main.dart';

import 'firebase_options.dart';
import 'helper/prefs.dart';
import 'helper/theme_data.dart';

String appId = "96661";
String authKey = "xJpMGKGQD9EevKu";
String authSecret = "5Oy5vFZzL4gXRDr";
String accountKey = "T8KBZTqUsVHtuUvtKBdz";

int userId = 0;

late Prefs prefs;
late FirebaseHelper firebaseHelper;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = Prefs();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  firebaseHelper = FirebaseHelper();

  // firebaseHelper.addDummyData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Training Kits',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      defaultTransition: Transition.rightToLeftWithFade,
      home: const MainScreen(),
    );
  }
}
