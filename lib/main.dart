import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/welcome_screen.dart';
import './screens/login_screen.dart';
import './screens/register_screen.dart';
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
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        HomePage.id: (context) => HomePage(mqttClient: mqttClient),
      },
    );
  }
}
