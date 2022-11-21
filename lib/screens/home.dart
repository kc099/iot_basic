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
  int _selectedIndex = 0;

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
            children: <Widget>[Expanded(
              child: ListView(
                children: <Widget>[
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
                    child: ReusableCard(
                      colour: (Colors.amber[100])!,
                      text: 'Living Room',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('bedroom pressed');
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
                    child: ReusableCard(
                      colour: (Colors.amber[100])!,
                      text: 'Bed Room',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('kitchen pressed.');
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
                    child: ReusableCard(
                      colour: (Colors.amber[100])!,
                      text: 'Kitchen',
                    ),
                  ),
                ],
              ),
            ),]
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
            icon: Icon(Icons.pie_chart),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff21b409),
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
