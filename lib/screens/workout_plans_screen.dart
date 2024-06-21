import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouit/common_widget/common_rotating_card.dart';
import '../providers/workouts_provider.dart';
import '../models/workout_model.dart';

class WorkoutPlansScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final workouts = Provider.of<WorkoutsProvider>(context).workoutPlans;
    print(workouts);

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Plans'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return CommonWorkoutRotatingCard(
            title: workout.name,
            duration: '${workout.duration} mins',
            imageUrl:
                'assets/workout/${workout.id}.png', // Ensure the correct path
            type: workout.description,
            difficulty: workout.difficulty,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a screen to add a new workout plan
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
