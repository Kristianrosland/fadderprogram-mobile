import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  IconLabel({
    @required this.label,
  });

  final label;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(label,
            style: TextStyle(
                fontSize: 15, color: Color.fromRGBO(150, 150, 150, 1))),
        padding: const EdgeInsets.only(bottom: 7.5));
  }
}
