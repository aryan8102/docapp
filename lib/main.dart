


import 'package:doctorconsultant/auth/patient_login.dart';
import 'package:doctorconsultant/auth/signin_screen.dart';
import 'package:doctorconsultant/auth/signup_screen.dart';
import 'package:doctorconsultant/screens/add_post.dart';
import 'package:doctorconsultant/screens/admin_screen.dart';
import 'package:doctorconsultant/screens/patient_info.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:doctorconsultant/firestore/firestore_list.dart';
import 'package:doctorconsultant/screens/doctorportal.dart';

import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  FirebaseMessaging.instance.onTokenRefresh
      .listen((fcmToken) {
    // TODO: If necessary send token to application server.

    // Note: This callback is fired at each app startup and whenever a new
    // token is generated.
  })
      .onError((err) {
    // Error getting token.
  });
  await FirebaseMessaging.instance.setAutoInitEnabled(true);


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(scaffoldBackgroundColor: Colors.teal.shade200),
      home: PatientLoginWithPhoneNumber(),
    );
  }
}


