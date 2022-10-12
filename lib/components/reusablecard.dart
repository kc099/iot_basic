import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({Key? key, required this.colour, required this.text})
      : super(key: key);

  final Color colour;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: colour,
      height: 100.0,
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
    );
  }
}
