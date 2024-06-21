import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouit/common_widget/common_elevated_button.dart';
import 'package:workouit/providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user?.profileImageUrl ??
                      'https://example.com/default-profile.jpg'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                user?.name ?? 'Unknown',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                user?.email ?? 'Unknown',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Fitness Goals',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              user?.fitnessGoals ?? 'Unknown',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Dietary Preferences',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              user?.dietaryPreferences ?? 'Unknown',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Workout Statistics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      user?.workoutStatistics['totalWorkouts']?.toString() ??
                          '0',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('Total Workouts', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      user?.workoutStatistics['caloriesBurned']?.toString() ??
                          '0',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('Calories Burned', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: CommonElevatedButton(
                text: 'Edit Profile',
                onTap: () {
                  // Navigate to the edit profile screen or perform other actions
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
