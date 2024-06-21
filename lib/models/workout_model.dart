class WorkoutModel {
  final String id;
  final String name;
  final String description;
  final int duration; // Duration in minutes
  final String difficulty; // e.g., Beginner, Intermediate, Advanced

  WorkoutModel({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.difficulty,
  });

  // Convert WorkoutModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'duration': duration,
      'difficulty': difficulty,
    };
  }

  // Create WorkoutModel from JSON
  factory WorkoutModel.fromJson(Map<String, dynamic> json) {
    return WorkoutModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      difficulty: json['difficulty'],
    );
  }
}
