import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DhtDataScreen extends StatefulWidget {
  @override
  _DhtDataScreenState createState() => _DhtDataScreenState();
}

class _DhtDataScreenState extends State<DhtDataScreen> {
  CollectionReference dhtCollection = FirebaseFirestore.instance.collection('DHT');
  late QuerySnapshot dhtSnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DHT Verileri'),
      ),
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
          future: dhtCollection.get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Veriler yüklenirken bir hata oluştu: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            dhtSnapshot = snapshot.data!;
            return ListView.builder(
              itemCount: dhtSnapshot.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot documentSnapshot = dhtSnapshot.docs[index];
                final Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
                return ListTile(
                  title: Text('Sıcaklık: ${data['temperature']} °C'),
                  subtitle: Text('Nem: ${data['hum']} %'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
