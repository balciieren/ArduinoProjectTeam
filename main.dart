import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dhtdatascreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'DHT Verileri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DhtDataScreen(), // Burada DhtDataScreen sınıfını belirtiyoruz
    );
  }
}
