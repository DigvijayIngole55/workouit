import 'package:flutter/material.dart';

class CommonLogoWidget extends StatelessWidget {
  const CommonLogoWidget({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Image.asset(
        path,
        height: 150,
      ),
    );
  }
}
