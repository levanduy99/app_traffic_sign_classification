import 'package:classify_traffic_sign/app_screens/traffic_sign_details.dart';
import 'package:classify_traffic_sign/model/traffic_signs.dart';
import 'package:flutter/material.dart';
import 'package:classify_traffic_sign/widget/search_widget.dart';
import 'package:firebase_database/firebase_database.dart';

class TrafficSignsList extends StatefulWidget {
  @override
  TrafficSignsListState createState() => TrafficSignsListState();
}

class TrafficSignsListState extends State<TrafficSignsList>{
  List<TrafficSigns> trafficSigns;
  String query = '';

  @override
  void initState() {
    super.initState();
    //get list from fire base
    DatabaseReference databaseReference =  FirebaseDatabase.instance
        .reference().child("Data");
    databaseReference.once().then((DataSnapshot dataSnapshot){
      trafficSignsList.clear();
      print(dataSnapshot.value);
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for(var key in keys){
        TrafficSigns trafficSigns = new TrafficSigns(
          values [key]['title'],
          values [key]['description'],
          values [key]['imageUrl'],
        );
        trafficSignsList.add(trafficSigns);
      }
      setState(() {
        print('Length : ${trafficSignsList.length}');
      });
    });
    trafficSigns = trafficSignsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Signs"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
            itemCount: trafficSigns.length,
            itemBuilder: (context, index) {
              TrafficSigns trafficSign = trafficSigns[index];
              return Card(
                child: ListTile(
                  hoverColor: Colors.black12,
                  title: Text(trafficSign.title),
                  leading: Image.network(
                    trafficSign.imageUrl,
                  ),
                  trailing: Icon(Icons.arrow_forward_rounded),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => TrafficSignDetails(trafficSign)));
                  },
                ),
              );
            },
          ),)
        ],
      )
    );
  }

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Traffic Sign Name',
    onChanged: searchTrafficSign,
  );

  void searchTrafficSign(String query) {
    final trafficSigns = trafficSignsList.where((trafficSigns) {
      final titleLower = trafficSigns.title.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.trafficSigns = trafficSigns;
    });
  }
}