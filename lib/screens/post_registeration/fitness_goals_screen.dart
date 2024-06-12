import 'package:flutter/material.dart';
import 'package:workouit/common_widget/common_dropDown_button.dart';
import 'package:workouit/common_widget/common_slider.dart';
import 'package:workouit/common_widget/logo_widget.dart';

import '../../common_widget/common_text_form_feild.dart';

class FitnessGoalsScreen extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final TextEditingController fitnessGoalsController;
  final TextEditingController targetWeightController;
  final TextEditingController targetBMIController;
  final TextEditingController weeklyExerciseFrequencyController;
  final TextEditingController otherFitnessGoalController;

  FitnessGoalsScreen({
    required this.onNext,
    required this.onPrevious,
    required this.fitnessGoalsController,
    required this.targetWeightController,
    required this.targetBMIController,
    required this.weeklyExerciseFrequencyController,
    required this.otherFitnessGoalController,
  });

  @override
  _FitnessGoalsScreenState createState() => _FitnessGoalsScreenState();
}

class _FitnessGoalsScreenState extends State<FitnessGoalsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _targetWeight = 70; // Initial target weight in kg
  double _targetBMI = 22; // Initial target BMI
  double _weeklyExerciseFrequency = 3; // Initial weekly exercise frequency
  String? _fitnessGoal;

  @override
  void initState() {
    super.initState();
    widget.targetWeightController.text = _targetWeight.toString();
    widget.targetBMIController.text = _targetBMI.toString();
    widget.weeklyExerciseFrequencyController.text =
        _weeklyExerciseFrequency.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              CommonLogoWidget(path: "assets/logo/workouit.png"),
              CommonDropdownButton(
                label: 'Fitness Goal',
                value: _fitnessGoal,
                items: [
                  'Lose Weight',
                  'Gain Muscle',
                  'Maintain Weight',
                  'Improve Endurance',
                  'Other'
                ],
                onChanged: (newValue) {
                  setState(() {
                    _fitnessGoal = newValue;
                    widget.fitnessGoalsController.text = newValue!;
                  });
                },
              ),
              if (_fitnessGoal == 'Other')
                CommonTextField(
                  controller: widget.otherFitnessGoalController,
                  label: 'Please specify',
                ),
              const SizedBox(height: 20),
              CommonSlider(
                label: 'Target Weight (kg)',
                value: _targetWeight,
                min: 30,
                max: 200,
                divisions: 170,
                onChanged: (value) {
                  setState(() {
                    _targetWeight = value;
                    widget.targetWeightController.text = value.toString();
                  });
                },
              ),
              const SizedBox(height: 20),
              CommonSlider(
                label: 'Target BMI',
                value: _targetBMI,
                min: 10,
                max: 40,
                divisions: 30,
                onChanged: (value) {
                  setState(() {
                    _targetBMI = value;
                    widget.targetBMIController.text = value.toString();
                  });
                },
              ),
              const SizedBox(height: 20),
              CommonSlider(
                label: 'Weekly Exercise Frequency',
                value: _weeklyExerciseFrequency,
                min: 0,
                max: 7,
                divisions: 7,
                onChanged: (value) {
                  setState(() {
                    _weeklyExerciseFrequency = value;
                    widget.weeklyExerciseFrequencyController.text =
                        value.toInt().toString();
                  });
                },
              ),
              const SizedBox(height: 20),
            ],
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
              icon: Icon(Icons.check),
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
