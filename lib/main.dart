import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouit/providers/auth_provider.dart';
import 'package:workouit/providers/user_provider.dart';
import 'package:workouit/providers/workouts_provider.dart';
import 'package:workouit/screens/home_screen.dart';
import 'package:workouit/screens/auth/login_screen.dart';
import 'package:workouit/screens/main_screen.dart';
import 'package:workouit/screens/post_registeration/post_registeration.dart';
import 'package:workouit/screens/profile_screen.dart';
import 'package:workouit/screens/auth/register_screen.dart';
import 'package:workouit/screens/stats_screen.dart';
import 'package:workouit/screens/workout_plans_screen.dart';
import 'package:workouit/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AutheProvider()),
        ChangeNotifierProvider(create: (context) => WorkoutsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Planner',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: AuthWrapper(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/post_registration': (context) => PostRegistrationScreen(),
        '/profile': (context) => ProfileScreen(),
        '/register': (context) => RegisterScreen(),
        '/stats': (context) => StatsScreen(),
        '/workout_plans': (context) => WorkoutPlansScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AutheProvider>(
      builder: (context, authProvider, child) {
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('AuthWrapper: Waiting for authentication state');
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.hasData) {
              print('AuthWrapper: User is signed in');
              return MainScreen();
            } else {
              print('AuthWrapper: User is not signed in');
              return LoginScreen();
            }
          },
        );
      },
    );
  }
}
