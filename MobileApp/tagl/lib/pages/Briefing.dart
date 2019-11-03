import 'package:flutter/material.dart';

class Briefing extends StatefulWidget {
  @override
  _BriefingState createState() => _BriefingState();
}

class _BriefingState extends State<Briefing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Briefing"),
        centerTitle: true,
      ),
    );
  }
}