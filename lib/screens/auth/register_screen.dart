import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouit/common_widget/common_elevated_button.dart';
import 'package:workouit/common_widget/common_text_button.dart';
import 'package:workouit/common_widget/common_text_form_feild.dart';
import 'package:workouit/common_widget/logo_widget.dart';
import 'package:workouit/providers/auth_provider.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool isVisible = true;

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonLogoWidget(
              path: "assets/logo/register.png",
            ),
            CommonTextField(
              controller: _emailController,
              label: 'Email',
            ),
            const SizedBox(height: 20),
            // Password TextField
            CommonTextField(
              controller: _passwordController,
              label: 'Password',
              isPassword: true,
            ),
            const SizedBox(height: 20),
            // Register Button
            CommonElevatedButton(
              text: 'Register',
              onTap: () async {
                final email = _emailController.text;
                final password = _passwordController.text;
                try {
                  await Provider.of<AutheProvider>(context, listen: false)
                      .register(email, password);
                  Navigator.of(context).pushReplacementNamed('/home');
                } catch (error) {
                  // Handle error (show a message to the user)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to register: ${error.toString()}'),
                    ),
                  );
                }
              },
            ),
            CommonLoadingTextButton(
              text: 'Already have an account? Login',
              onTap: () => Navigator.of(context).pushReplacementNamed('/login'),
            ),
          ],
        ),
      ),
    );
  }
}
