import 'package:flutter/material.dart';

class Simulation extends StatefulWidget {
  @override
  _SimulationState createState() => _SimulationState();
}

class _SimulationState extends State<Simulation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simulation"),
        centerTitle: true,
      ),
    );
  }
}