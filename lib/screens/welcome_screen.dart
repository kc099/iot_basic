import 'package:flutter/material.dart';
import 'package:iot_basic/components/rounded_button.dart';
import 'package:iot_basic/screens/login_screen.dart';
import 'package:iot_basic/screens/register_screen.dart';
import 'package:iot_basic/network/mqtt.dart';

class WelcomeScreen extends StatefulWidget {
   WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';
  final MQTTClientWrapper mqttClient = MQTTClientWrapper();

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.jpg'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  title: 'Log In',
                  colour: const Color(0xf00a1cce),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  title: 'Register',
                  colour: const Color(0xff21b409),
                  onPressed: () {
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}