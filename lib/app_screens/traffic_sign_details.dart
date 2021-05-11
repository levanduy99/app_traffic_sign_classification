import 'package:flutter/material.dart';
import 'package:classify_traffic_sign/model/traffic_signs.dart';

class TrafficSignDetails extends StatelessWidget{
  final TrafficSigns trafficSigns;

  TrafficSignDetails(this.trafficSigns);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(trafficSigns.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                trafficSigns.imageUrl,
                height: 500,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  trafficSigns.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}