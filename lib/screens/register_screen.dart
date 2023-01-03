import 'package:flutter/material.dart';
import 'package:iot_basic/constants.dart';
import 'package:http/http.dart' as http;

// class extending dart <String> datatype.
// These methods can be called on strings used in this file.
extension ExtString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String id = 'registration_screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email;
  late String password;
  bool showSpinner = false;
  final GlobalKey<FormState> _key = GlobalKey();
  var url = Uri.http('192.168.0.154:8000', '/api/user/create/');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
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
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Flexible(
                      child: SizedBox(
                        height: 200.0,
                        child: Image.asset('images/logo.jpg'),
                      ),
                    ),
                    Form(
                      key: _key,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Required Name';
                              }
                              return null;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your name'),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Required Email';
                              } else if (!value.isValidEmail) {
                                return '*Enter valid email';
                              }
                              return null;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your email'),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Password cannot be empty';
                              }
                              return null;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your password'),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Please re-enter password';
                              }
                              return null;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Re-enter your password'),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Account Nickname (Optional)'),
                          ),
                          const SizedBox(height: 15.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Material(
                                  color: const Color(0xff21b409),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0)),
                                  elevation: 5.0,
                                  child: MaterialButton(
                                    onPressed: () async {
                                      if (_key.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );
                                        var response =
                                            await http.post(url, body: {});
                                        print(
                                            'Response status: ${response.statusCode}');
                                        print(
                                            'Response body: ${response.body}');
                                      }
                                    },
                                    minWidth: 200.0,
                                    height: 42.0,
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
