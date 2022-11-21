import 'package:flutter/material.dart';
import 'package:iot_basic/components/reusablecard.dart';
import '../network/mqtt.dart';

const List<String> list = <String>['Edit', 'Delete'];

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key, required this.mqttClient}) : super(key: key);
  static const String id = 'home';
  final MQTTClientWrapper mqttClient;

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
          child: Center(
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: const Icon(
                      Icons.chevron_left,
                      size: 36,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text('Device Name'),
                  const Icon(
                    Icons.edit,
                    size: 24,
                  ),
                ],
              ),
              const SizedBox(
                height: 150.0,
              ),
              GestureDetector(
                child: const Icon(
                  Icons.power_settings_new,
                  size: 147,
                ),
                onTap: () {
                  print('power pressed');
                },
              ),
              const SizedBox(
                height: 100.0,
              ),
              GestureDetector(
                child: const ReusableCard(
                  colour: Colors.black26,
                  text: '',
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_mosaic_outlined),
            label: 'Automations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Device Usage',
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
