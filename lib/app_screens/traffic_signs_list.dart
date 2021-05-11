import 'package:classify_traffic_sign/app_screens/traffic_sign_details.dart';
import 'package:classify_traffic_sign/model/traffic_signs.dart';
import 'package:flutter/material.dart';

class TrafficSignsList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Traffic Signs"),
      ),
      body: ListView.builder(
        itemCount: trafficSignsList.length,
        itemBuilder: (context, index) {
          TrafficSigns trafficSigns = trafficSignsList[index];
          return Card(
            child: ListTile(
              hoverColor: Colors.black12,
              title: Text(trafficSigns.title),
              leading: Image.network(trafficSigns.imageUrl),
              trailing: Icon(Icons.arrow_forward_rounded),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TrafficSignDetails(trafficSigns)));
              },
            ),
          );
        },
      ),
    );
  }
}