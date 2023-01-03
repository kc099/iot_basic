import 'package:flutter/material.dart';
import 'package:iot_basic/network/mqtt.dart';
import '../screens/room.dart';
import './reusablecard.dart';

getDrawerWidget(int index, BuildContext context, MQTTClientWrapper mqttClient,
    Function updateState) {
  switch (index) {
    case 0:
      return _homeListView(context, mqttClient, updateState);
    // break;
    case 1:
      return _profileView(context);
    // break;
    case 2:
      return _profileView(context);
    // break;
  }
}

Widget _homeListView(
    BuildContext context, MQTTClientWrapper mqttClient, Function updateState) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 16.0, 16.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('hello'),
            GestureDetector(
              onTap: () {
                print('add device');
              },
              child: const Icon(
                Icons.add_circle_outlined,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: ListView(
          children: <Widget>[
            ReusableCard(
              colour: (Colors.amber[100])!,
              text: 'Living Room',
              mqttClient: mqttClient,
              // cardType:
            ),
            ReusableCard(
              colour: (Colors.amber[100])!,
              text: 'Living Room',
              mqttClient: mqttClient,
              // cardType:
            ),
            ReusableCard(
              colour: (Colors.amber[100])!,
              text: 'Living Room',
              mqttClient: mqttClient,
              // cardType:
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: ExpansionTile(
                title: const Text('Indus Smart Switch'),
                // subtitle: Text('click to expand'),
                children: <Widget>[
                  ReusableCard(
                    colour: (Colors.amber[100])!,
                    text: 'Living Room',
                    mqttClient: mqttClient,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _profileView(BuildContext context) {
  return Column(
    children: [
      const SizedBox(
        height: 20.0,
      ),
      Expanded(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print('profile tapped');
                },
                child: Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  alignment: Alignment.center,
                  child: const CircleAvatar(
                    radius: 80.0,
                  ),
                ),
              ),
              title: const Text('Hi, User'),
              trailing: GestureDetector(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      // title: const Text('AlertDialog Title'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Logout'),
                          child: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Icon(
                  Icons.power_settings_new_sharp,
                  color: Colors.red,
                  size: 36,
                ),
              ),
              dense: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Card(
              child: ListTile(
                title: Text('Change Login Password'),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('FAQ & Feedback'),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('About'),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('Privacy Settings'),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('Privacy Policy Management'),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
