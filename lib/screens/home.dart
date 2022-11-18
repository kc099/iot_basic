import 'package:flutter/material.dart';
import 'package:iot_basic/components/reusablecard.dart';
import 'package:iot_basic/screens/room.dart';
import 'package:iot_basic/network/mqtt.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key, required this.mqttClient}) : super(key: key);
  static const String id = 'home';
  final MQTTClientWrapper mqttClient;

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // mqtt_client.prepareMqttClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const ReusableCard(
                colour: const Color(0x4f0a1cce),
                text: 'Indus Smart Home',
              ),
              GestureDetector(
                onTap: () {
                  print('livingroom pressed.');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RoomPage(
                          mqttClient: widget.mqttClient,
                        );
                      },
                    ),
                  );
                },
                child: const ReusableCard(
                  colour: Colors.black26,
                  text: 'Living Room',
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('bedroom pressed');
                },
                child: const ReusableCard(
                  colour: Colors.black26,
                  text: 'Bed Room',
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('kitchen pressed.');
                },
                child: const ReusableCard(
                  colour: Colors.black26,
                  text: 'Kitchen',
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (value) {},
      ),
    );
  }
}
