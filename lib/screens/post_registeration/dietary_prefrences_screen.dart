import 'package:flutter/material.dart';
import 'package:workouit/common_widget/common_dropDown_button.dart';
import 'package:workouit/common_widget/common_slider.dart';
import 'package:workouit/common_widget/common_text_form_feild.dart';
import 'package:workouit/common_widget/logo_widget.dart';

class DietaryPreferencesScreen extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final TextEditingController dietTypeController;
  final TextEditingController caloricIntakeController;
  final TextEditingController allergiesController;
  final TextEditingController mealTimesController;
  final TextEditingController cuisinesController;
  final TextEditingController dietaryRestrictionsController;
  final TextEditingController waterIntakeController;
  final TextEditingController otherDietTypeController;
  final TextEditingController otherCuisineController;

  DietaryPreferencesScreen({
    required this.onNext,
    required this.onPrevious,
    required this.dietTypeController,
    required this.caloricIntakeController,
    required this.allergiesController,
    required this.mealTimesController,
    required this.cuisinesController,
    required this.dietaryRestrictionsController,
    required this.waterIntakeController,
    required this.otherDietTypeController,
    required this.otherCuisineController,
  });

  @override
  _DietaryPreferencesScreenState createState() =>
      _DietaryPreferencesScreenState();
}

class _DietaryPreferencesScreenState extends State<DietaryPreferencesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _caloricIntake = 2000; // Initial caloric intake
  double _waterIntake = 2; // Initial water intake in liters
  String? _dietType;
  String? _cuisine;

  @override
  void initState() {
    super.initState();
    widget.caloricIntakeController.text = _caloricIntake.toInt().toString();
    widget.waterIntakeController.text = _waterIntake.toString();
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
                label: 'Diet Type',
                value: _dietType,
                items: [
                  'Vegetarian',
                  'Vegan',
                  'Pescatarian',
                  'Omnivore',
                  'Other'
                ],
                onChanged: (newValue) {
                  setState(() {
                    _dietType = newValue;
                    widget.dietTypeController.text = newValue!;
                  });
                },
              ),
              if (_dietType == 'Other')
                CommonTextField(
                  controller: widget.otherDietTypeController,
                  label: 'Please specify',
                ),
              const SizedBox(height: 20),
              CommonSlider(
                label: 'Daily Caloric Intake',
                value: _caloricIntake,
                min: 1000,
                max: 4000,
                divisions: 30,
                onChanged: (value) {
                  setState(() {
                    _caloricIntake = value;
                    widget.caloricIntakeController.text =
                        value.toInt().toString();
                  });
                },
              ),
              const SizedBox(height: 20),
              CommonTextField(
                controller: widget.allergiesController,
                label: 'Food Allergies',
              ),
              const SizedBox(height: 20),
              CommonDropdownButton(
                label: 'Preferred Meal Times',
                value: widget.mealTimesController.text.isNotEmpty
                    ? widget.mealTimesController.text
                    : null,
                items: ['Breakfast', 'Lunch', 'Dinner', 'Snacks'],
                onChanged: (newValue) {
                  widget.mealTimesController.text = newValue!;
                },
              ),
              const SizedBox(height: 20),
              CommonDropdownButton(
                label: 'Favorite Cuisines',
                value: _cuisine,
                items: ['Italian', 'Chinese', 'Indian', 'Mexican', 'Other'],
                onChanged: (newValue) {
                  setState(() {
                    _cuisine = newValue;
                    widget.cuisinesController.text = newValue!;
                  });
                },
              ),
              if (_cuisine == 'Other')
                CommonTextField(
                  controller: widget.otherCuisineController,
                  label: 'Please specify',
                ),
              const SizedBox(height: 20),
              CommonTextField(
                controller: widget.dietaryRestrictionsController,
                label: 'Dietary Restrictions',
              ),
              const SizedBox(height: 20),
              CommonSlider(
                label: 'Water Intake (liters/day)',
                value: _waterIntake,
                min: 0.5,
                max: 5,
                divisions: 9,
                onChanged: (value) {
                  setState(() {
                    _waterIntake = value;
                    widget.waterIntakeController.text = value.toString();
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
