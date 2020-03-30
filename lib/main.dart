import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './eventCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fadderprogram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Fadderprogram'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _gruppe = "8";

  @override
  void initState() {
    super.initState();
    print("[initState]");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('events').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new ListView(
                    children: snapshot.data.documents
                        .where((event) =>
                            event.exists &&
                            event.data != null &&
                            event.data['groups'].contains(_gruppe))
                        .map((DocumentSnapshot document) {
                      return new EventCard(
                          title: document['title_NO'],
                          description: document['desc_NO'],
                          startTime: document['start_time'],
                          endTime: document['end_time'],
                          address: document['address'],
                          from: document['from_NO']);
                    }).toList(),
                  );
              }
            },
          ),
        ));
  }
}
