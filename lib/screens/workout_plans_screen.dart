import 'package:flutter/material.dart';

class WorkOutPlansScreen extends StatelessWidget {
  const WorkOutPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plans'),
      ),
      body: Center(
        child: Text('Workout Plans Screen'),
      ),
    );
  }
}
