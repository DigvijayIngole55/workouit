import 'package:flutter/material.dart';
import 'package:workouit/models/motivational_tips_model.dart';
import 'package:workouit/models/previous_workout_model.dart';
import 'package:workouit/models/recent_acitivity_model.dart';
import 'package:workouit/models/workout_model.dart';

class WorkoutsProvider with ChangeNotifier {
  List<PreviousWorkoutModel> _previousWorkouts = [
    PreviousWorkoutModel(
      id: '1',
      name: 'Full Body Workout',
      duration: '45 mins',
      banner: 'assets/workout/1.png',
    ),
    PreviousWorkoutModel(
      id: '2',
      name: 'Morning Yoga',
      duration: '30 mins',
      banner: 'assets/workout/2.png',
    ),
    // Add more default workouts as needed
  ];

  List<RecentActivityModel> _recentActivities = [
    RecentActivityModel(
      id: '1',
      name: 'Morning Run',
      time: 'Today, 6:00 AM',
      duration: '30 mins',
      calories: '300 kcal',
    ),
    RecentActivityModel(
      id: '2',
      name: 'Yoga Session',
      time: 'Yesterday, 7:00 PM',
      duration: '60 mins',
      calories: '250 kcal',
    ),
    // Add more default activities as needed
  ];

  List<MotivationalTipModel> _motivationalTips = [
    MotivationalTipModel(
        tip:
            'Remember to stay hydrated and maintain a balanced diet for optimal performance.'),
    MotivationalTipModel(
        tip: 'Consistency is key. Keep pushing, and results will follow.'),
    // Add more default tips as needed
  ];

  List<WorkoutModel> _workoutPlans = [
    WorkoutModel(
      id: '1',
      name: 'Strength Training',
      description: 'A full-body strength training workout.',
      duration: 60,
      difficulty: 'Intermediate',
    ),
    WorkoutModel(
      id: '2',
      name: 'Cardio Blast',
      description: 'A high-intensity cardio workout.',
      duration: 45,
      difficulty: 'Advanced',
    ),
    // Add more default workout plans as needed
  ];

  List<PreviousWorkoutModel> get previousWorkouts => _previousWorkouts;
  List<RecentActivityModel> get recentActivities => _recentActivities;
  List<MotivationalTipModel> get motivationalTips => _motivationalTips;
  List<WorkoutModel> get workoutPlans => _workoutPlans;

  void setPreviousWorkouts(List<PreviousWorkoutModel> workouts) {
    _previousWorkouts = workouts;
    notifyListeners();
  }

  void setRecentActivities(List<RecentActivityModel> activities) {
    _recentActivities = activities;
    notifyListeners();
  }

  void setMotivationalTips(List<MotivationalTipModel> tips) {
    _motivationalTips = tips;
    notifyListeners();
  }

  void setWorkoutPlans(List<WorkoutModel> plans) {
    _workoutPlans = plans;
    notifyListeners();
  }
}
