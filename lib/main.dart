import 'package:flutter/material.dart';
import 'package:iot_basic/screens/home.dart';
import 'package:iot_basic/screens/welcome_screen.dart';
import 'package:iot_basic/screens/login_screen.dart';
import 'package:iot_basic/screens/register_screen.dart';
import 'network/mqtt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MQTTClientWrapper mqttClient = MQTTClientWrapper();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: homepage.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        homepage.id: (context) => homepage(mqttClient: mqttClient),
      },
    );
  }
}
