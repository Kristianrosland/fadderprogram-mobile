import 'package:flutter/material.dart';
import './iconLabel.dart';

class EventCard extends StatelessWidget {
  EventCard({
    @required this.title,
    this.description,
    this.startTime,
    this.endTime,
    this.address,
    this.from,
  });

  final title;
  final description;
  final startTime;
  final endTime;
  final address;
  final from;

  @override
  Widget build(BuildContext context) {
    var timeLabel = startTime != null && endTime != null
        ? startTime + ' - ' + endTime
        : startTime != null ? startTime : null;

    return Card(
        child: Container(
            padding: const EdgeInsets.only(
                top: 20.0, left: 30.0, right: 30.0, bottom: 20.0),
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                address != null ? IconLabel(label: address) : null,
                timeLabel != null ? IconLabel(label: timeLabel) : null,
                from != null ? IconLabel(label: 'Fra ' + from) : null,
                Text(description),
              ],
            )));
  }
}
