import 'package:flutter/material.dart';
import 'package:workouit/common_widget/common_dropDown_button.dart';
import 'package:workouit/common_widget/common_slider.dart';
import 'package:workouit/common_widget/common_text_form_feild.dart';
import 'package:workouit/common_widget/logo_widget.dart';

class WorkoutStatisticsScreen extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final TextEditingController workoutsPerWeekController;
  final TextEditingController averageWorkoutDurationController;
  final TextEditingController caloriesBurnedController;
  final TextEditingController preferredWorkoutTypeController;
  final TextEditingController preferredWorkoutTimeController;
  final TextEditingController workoutLocationController;
  final TextEditingController fitnessDevicesController;
  final TextEditingController workoutGoalsController;

  WorkoutStatisticsScreen({
    required this.onNext,
    required this.onPrevious,
    required this.workoutsPerWeekController,
    required this.averageWorkoutDurationController,
    required this.caloriesBurnedController,
    required this.preferredWorkoutTypeController,
    required this.preferredWorkoutTimeController,
    required this.workoutLocationController,
    required this.fitnessDevicesController,
    required this.workoutGoalsController,
  });

  @override
  _WorkoutStatisticsScreenState createState() =>
      _WorkoutStatisticsScreenState();
}

class _WorkoutStatisticsScreenState extends State<WorkoutStatisticsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _workoutsPerWeek = 3;
  double _averageWorkoutDuration = 30;
  String? _preferredWorkoutType;
  String? _preferredWorkoutTime;
  String? _workoutLocation;

  @override
  void initState() {
    super.initState();
    widget.workoutsPerWeekController.text = _workoutsPerWeek.toInt().toString();
    widget.averageWorkoutDurationController.text =
        _averageWorkoutDuration.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                CommonLogoWidget(path: "assets/logo/workouit.png"),
                CommonSlider(
                  label: 'Workouts per Week',
                  value: _workoutsPerWeek,
                  min: 1,
                  max: 7,
                  divisions: 6,
                  onChanged: (value) {
                    setState(() {
                      _workoutsPerWeek = value;
                      widget.workoutsPerWeekController.text =
                          value.toInt().toString();
                    });
                  },
                ),
                const SizedBox(height: 20),
                CommonSlider(
                  label: 'Average Workout Duration (minutes)',
                  value: _averageWorkoutDuration,
                  min: 10,
                  max: 120,
                  divisions: 11,
                  onChanged: (value) {
                    setState(() {
                      _averageWorkoutDuration = value;
                      widget.averageWorkoutDurationController.text =
                          value.toInt().toString();
                    });
                  },
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  controller: widget.caloriesBurnedController,
                  label: 'Calories Burned per Workout',
                  regexPattern: r'^\d+$',
                  errorMessage: 'Please enter a valid number',
                ),
                const SizedBox(height: 20),
                CommonDropdownButton(
                  label: 'Preferred Workout Type',
                  value: _preferredWorkoutType,
                  items: ['Cardio', 'Strength Training', 'Yoga', 'Pilates'],
                  onChanged: (newValue) {
                    setState(() {
                      _preferredWorkoutType = newValue;
                      widget.preferredWorkoutTypeController.text = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CommonDropdownButton(
                  label: 'Preferred Workout Time',
                  value: _preferredWorkoutTime,
                  items: ['Morning', 'Afternoon', 'Evening'],
                  onChanged: (newValue) {
                    setState(() {
                      _preferredWorkoutTime = newValue;
                      widget.preferredWorkoutTimeController.text = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CommonDropdownButton(
                  label: 'Workout Location',
                  value: _workoutLocation,
                  items: ['Gym', 'Home', 'Outdoor'],
                  onChanged: (newValue) {
                    setState(() {
                      _workoutLocation = newValue;
                      widget.workoutLocationController.text = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  title: Text('Use of Fitness Devices'),
                  value: widget.fitnessDevicesController.text == 'true',
                  onChanged: (bool value) {
                    setState(() {
                      widget.fitnessDevicesController.text = value.toString();
                    });
                  },
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  controller: widget.workoutGoalsController,
                  label: 'Workout Goals',
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                if (_formKey.currentState!.validate() || true) {
                  widget.onPrevious();
                }
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                if (_formKey.currentState!.validate() || true) {
                  widget.onNext();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
