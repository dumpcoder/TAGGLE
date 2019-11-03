import 'package:flutter/material.dart';

class Evaluation extends StatefulWidget {
  @override
  _EvaluationState createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Evaluation"),
        centerTitle: true,
      ),
    );
  }
}