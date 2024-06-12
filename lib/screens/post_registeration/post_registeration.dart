import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:workouit/screens/post_registeration/dietary_prefrences_screen.dart';
import 'package:workouit/screens/post_registeration/fitness_goals_screen.dart';
import 'package:workouit/screens/post_registeration/personal_information_screen.dart';
import 'package:workouit/screens/post_registeration/workout_statistics_screen.dart';

class PostRegistrationScreen extends StatefulWidget {
  @override
  _PostRegistrationScreenState createState() => _PostRegistrationScreenState();
}

class _PostRegistrationScreenState extends State<PostRegistrationScreen> {
  final PageController _pageController = PageController();
  final int pageIndex = 0;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _workoutsPerWeekController =
      TextEditingController();
  final TextEditingController _averageWorkoutDurationController =
      TextEditingController();
  final TextEditingController _caloriesBurnedController =
      TextEditingController();
  final TextEditingController _dietTypeController = TextEditingController();
  final TextEditingController _caloricIntakeController =
      TextEditingController();
  final TextEditingController _allergiesController = TextEditingController();
  final TextEditingController _mealTimesController = TextEditingController();
  final TextEditingController _cuisinesController = TextEditingController();
  final TextEditingController _dietaryRestrictionsController =
      TextEditingController();
  final TextEditingController _waterIntakeController = TextEditingController();
  final TextEditingController _preferredWorkoutTypeController =
      TextEditingController();
  final TextEditingController _preferredWorkoutTimeController =
      TextEditingController();
  final TextEditingController _workoutLocationController =
      TextEditingController();
  final TextEditingController _fitnessDevicesController =
      TextEditingController();
  final TextEditingController _workoutGoalsController = TextEditingController();
  final TextEditingController _fitnessGoalsController = TextEditingController();
  final TextEditingController _targetWeightController = TextEditingController();
  final TextEditingController _targetBMIController = TextEditingController();
  final TextEditingController _weeklyExerciseFrequencyController =
      TextEditingController();
  final TextEditingController _otherDietTypeController =
      TextEditingController();
  final TextEditingController _otherCuisineController = TextEditingController();
  final TextEditingController _otherFitnessGoalController =
      TextEditingController();

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            PersonalInformationScreen(
              onNext: _nextPage,
              fullNameController: _fullNameController,
              emailController: _emailController,
              phoneController: _phoneController,
              dateOfBirthController: _dateOfBirthController,
              genderController: _genderController,
              heightController: _heightController,
              weightController: _weightController,
            ),
            WorkoutStatisticsScreen(
              onNext: _nextPage,
              onPrevious: _previousPage,
              workoutsPerWeekController: _workoutsPerWeekController,
              averageWorkoutDurationController:
                  _averageWorkoutDurationController,
              caloriesBurnedController: _caloriesBurnedController,
              preferredWorkoutTypeController: _preferredWorkoutTypeController,
              preferredWorkoutTimeController: _preferredWorkoutTimeController,
              workoutLocationController: _workoutLocationController,
              fitnessDevicesController: _fitnessDevicesController,
              workoutGoalsController: _workoutGoalsController,
            ),
            DietaryPreferencesScreen(
              onNext: _nextPage,
              onPrevious: _previousPage,
              dietTypeController: _dietTypeController,
              caloricIntakeController: _caloricIntakeController,
              allergiesController: _allergiesController,
              mealTimesController: _mealTimesController,
              cuisinesController: _cuisinesController,
              dietaryRestrictionsController: _dietaryRestrictionsController,
              waterIntakeController: _waterIntakeController,
              otherDietTypeController: _otherDietTypeController,
              otherCuisineController: _otherCuisineController,
            ),
            FitnessGoalsScreen(
              onNext: _nextPage,
              onPrevious: _previousPage,
              fitnessGoalsController: _fitnessGoalsController,
              targetWeightController: _targetWeightController,
              targetBMIController: _targetBMIController,
              weeklyExerciseFrequencyController:
                  _weeklyExerciseFrequencyController,
              otherFitnessGoalController: _otherFitnessGoalController,
            ),
          ],
        ),
      ]),
    );
  }
}
