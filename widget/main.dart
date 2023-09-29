import 'package:flutter/material.dart';
import 'package:blood_donation/project1/home.dart';
import 'package:blood_donation/project1/update.dart';
import 'package:blood_donation/project1/add.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo App",
      routes: {
        '/': (context) => Homepage(),
        '/add': (context) => Adduser(),
        '/update': (context) => updatedonor(),
      },
      initialRoute: '/',
    );
  }
}
