import 'package:flutter/material.dart';
import 'package:iot_basic/components/reusablecard.dart';
import '../network/mqtt.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key, required this.mqttClient}) : super(key: key);
  static const String id = 'home';
  final MQTTClientWrapper mqttClient;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          GestureDetector(
            onTap: () async {
              print(widget.mqttClient.connectionState);
              await widget.mqttClient.connectClient();
              widget.mqttClient.publishMessage('hello');
              // Navigator.p
            },
            child: const ReusableCard(
              text: 'bulb',
              colour: Colors.black26,
            ),
          ),
        ]),
      ),
    );
  }
}
