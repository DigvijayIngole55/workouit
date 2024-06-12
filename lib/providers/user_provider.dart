import 'package:flutter/material.dart';
import 'package:workouit/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void updateDietaryPreferences(String preferences) {
    if (_user != null) {
      _user!.dietaryPreferences = preferences;
      notifyListeners();
    }
  }

  void updateFitnessGoals(String goals) {
    if (_user != null) {
      _user!.fitnessGoals = goals;
      notifyListeners();
    }
  }

  void updateWorkoutStatistics(Map<String, dynamic> statistics) {
    if (_user != null) {
      _user!.workoutStatistics = statistics;
      notifyListeners();
    }
  }

  void updatePersonalInformation(
      String name, String email, int age, String gender) {
    if (_user != null) {
      _user!.name = name;
      _user!.email = email;
      _user!.age = age;
      _user!.gender = gender;
      notifyListeners();
    }
  }
}
