import 'package:flutter/material.dart';
import 'package:workouit/screens/home_screen.dart';
import 'package:workouit/screens/profile_screen.dart';
import 'package:workouit/screens/stats_screen.dart';
import 'package:workouit/screens/workout_plans_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Workout Planner',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.amber[800],
            unselectedItemColor: Colors.grey[600],
            backgroundColor: Colors.white,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        home: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    WorkOutPlansScreen(),
    StatsScreen(),
    ProfileScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Plans'),
          BottomNavigationBarItem(icon: Icon(Icons.assessment), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        currentIndex: _selectIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
