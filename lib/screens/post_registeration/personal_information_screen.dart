import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:workouit/common_widget/common_dropDown_button.dart';
import 'package:workouit/common_widget/common_slider.dart';
import 'package:workouit/common_widget/common_text_form_feild.dart';
import 'package:workouit/common_widget/logo_widget.dart';

class PersonalInformationScreen extends StatefulWidget {
  final VoidCallback onNext;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController dateOfBirthController;
  final TextEditingController genderController;
  final TextEditingController heightController;
  final TextEditingController weightController;

  PersonalInformationScreen({
    required this.onNext,
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.dateOfBirthController,
    required this.genderController,
    required this.heightController,
    required this.weightController,
  });

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                CommonLogoWidget(path: "assets/logo/workouit.png"),
                CommonTextField(
                  controller: widget.fullNameController,
                  label: 'Full Name',
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  controller: widget.emailController,
                  label: 'Email',
                  regexPattern: r'^[^@]+@[^@]+\.[^@]+',
                  errorMessage: 'Please enter a valid email address',
                ),
                const SizedBox(height: 20),
                IntlPhoneField(
                  controller: widget.phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  initialCountryCode: 'US',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
                const SizedBox(height: 20),
                CommonTextField(
                  controller: widget.dateOfBirthController,
                  label: 'Date of Birth',
                  suffixIcon: Icon(Icons.calendar_today),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      widget.dateOfBirthController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    }
                  },
                ),
                const SizedBox(height: 20),
                CommonDropdownButton(
                  label: 'Gender',
                  value: null,
                  items: ['Male', 'Female', 'Other'],
                  onChanged: (newValue) {
                    widget.genderController.text = newValue!;
                  },
                ),
                const SizedBox(height: 20),
                CommonSlider(
                  label: 'Height (cm)',
                  value: 170,
                  min: 100,
                  max: 250,
                  divisions: 150,
                  onChanged: (value) {
                    widget.heightController.text = value.toString();
                  },
                ),
                const SizedBox(height: 20),
                CommonSlider(
                  label: 'Weight (kg)',
                  value: 70,
                  min: 30,
                  max: 200,
                  divisions: 170,
                  onChanged: (value) {
                    setState(() {
                      widget.weightController.text = value.toString();
                    });
                  },
                ),
                const SizedBox(height: 20),
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
