import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'package:workouit/providers/workouts_provider.dart';

class HomeScreen extends StatelessWidget {
  final String name;

  const HomeScreen({
    Key? key,
    this.name = 'Digvijay',
  }) : super(key: key);

  String getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 20) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    final greetingMessage = getGreetingMessage();
    final workoutsProvider = Provider.of<WorkoutsProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$greetingMessage, $name!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CommonProfilePicture(
                      imagePath: 'assets/profile_picture.png',
                      radius: 24,
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Continue/Previous Workouts Section
                CommonSectionHeader(title: 'Continue/Previous Workouts'),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: workoutsProvider.previousWorkouts.length,
                    itemBuilder: (context, index) {
                      final workout = workoutsProvider.previousWorkouts[index];
                      return CommonRotatingCard(
                        title: workout.name,
                        duration: workout.duration,
                        imageUrl: workout.banner,
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Quick Access Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonQuickAccessButton(
                      icon: Icons.play_arrow,
                      label: 'Start Workout',
                      onTap: () {
                        // Start workout action
                      },
                    ),
                    CommonQuickAccessButton(
                      icon: Icons.add,
                      label: 'Log Activity',
                      onTap: () {
                        // Log activity action
                      },
                    ),
                    CommonQuickAccessButton(
                      icon: Icons.show_chart,
                      label: 'View Progress',
                      onTap: () {
                        // View progress action
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Activity Feed Section
                CommonSectionHeader(title: 'Recent Activities'),
                SizedBox(height: 10),
                ...workoutsProvider.recentActivities.map((activity) {
                  return CommonActivityTile(
                    title: activity.name,
                    subtitle: activity.time,
                    duration: activity.duration,
                    calories: activity.calories,
                  );
                }).toList(),
                SizedBox(height: 20),

                // Motivational Content Section
                CommonSectionHeader(title: 'Motivational Tips'),
                SizedBox(height: 10),
                ...workoutsProvider.motivationalTips.map((tip) {
                  return CommonMotivationalTip(
                    tip: tip.tip,
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommonProfilePicture extends StatelessWidget {
  final String imagePath;
  final double radius;

  const CommonProfilePicture(
      {Key? key, required this.imagePath, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(imagePath),
    );
  }
}

class CommonRotatingCard extends StatelessWidget {
  final String title;
  final String duration;
  final String imageUrl;

  const CommonRotatingCard({
    Key? key,
    required this.title,
    required this.duration,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: EdgeInsets.only(right: 16),
      child: Card(
        color: Color(0xFF2D2D2D), // Dark Gray background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white, // White text
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    duration,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[300], // Light Gray text
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonQuickAccessButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const CommonQuickAccessButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF2D2D2D), // Dark Gray background
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(icon),
              color: Color(0xFFE0FF64), // Neon Yellow icon
              onPressed: onTap,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}

class CommonActivityTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final String calories;

  const CommonActivityTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.calories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2D2D2D), // Dark Gray background
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xFFE0FF64), // Neon Yellow text
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.white70, // Light Gray text
            fontSize: 14,
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              duration,
              style: TextStyle(
                color: Colors.white, // White text
                fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Text(
              calories,
              style: TextStyle(
                color: Colors.white, // White text
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonMotivationalTip extends StatelessWidget {
  final String tip;

  const CommonMotivationalTip({Key? key, required this.tip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2D2D2D), // Dark Gray background
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tip of the Day',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE0FF64), // Neon Yellow text
              ),
            ),
            SizedBox(height: 10),
            Text(
              tip,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // White text
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonSectionHeader extends StatelessWidget {
  final String title;

  const CommonSectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
