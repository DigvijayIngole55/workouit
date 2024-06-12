class UserModel {
  String name;
  String email;
  int age;
  String gender;
  String dietaryPreferences;
  String fitnessGoals;
  Map<String, dynamic> workoutStatistics;
  DateTime registrationDate;

  UserModel({
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.dietaryPreferences,
    required this.fitnessGoals,
    required this.workoutStatistics,
    required this.registrationDate,
  });

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
      'gender': gender,
      'dietaryPreferences': dietaryPreferences,
      'fitnessGoals': fitnessGoals,
      'workoutStatistics': workoutStatistics,
      'registrationDate': registrationDate.toIso8601String(),
    };
  }

  // Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      age: json['age'],
      gender: json['gender'],
      dietaryPreferences: json['dietaryPreferences'],
      fitnessGoals: json['fitnessGoals'],
      workoutStatistics: Map<String, dynamic>.from(json['workoutStatistics']),
      registrationDate: DateTime.parse(json['registrationDate']),
    );
  }
}
