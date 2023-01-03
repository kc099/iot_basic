import 'package:flutter/material.dart';
import '../screens/room.dart';
import '../network/mqtt.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    required this.colour,
    required this.text,
    required this.mqttClient,
    // required this.status
  }) : super(key: key);

  final Color colour;
  final String text;
  final MQTTClientWrapper mqttClient;
  // final bool status = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RoomPage(
                mqttClient: mqttClient,
              );
            },
          ),
        );
      },
      child: Container(
        // color: colour,
        height: 80.0,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
          ],
        ),
      ),
    );
  }
}
