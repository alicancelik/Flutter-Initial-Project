import 'package:flutter/material.dart';

class ShowScreen extends StatefulWidget {
  ShowScreen({Key key, this.title, this.alican, this.muhammed})
      : super(key: key);

  final String title;
  final String alican;
  final String muhammed;

  @override
  _ShowScreenState createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: ListView(
          children: <Widget>[Text(widget.alican), Text(widget.muhammed)],
        ));
  }
}
