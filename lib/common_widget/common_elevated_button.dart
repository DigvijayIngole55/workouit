import 'package:flutter/material.dart';

class CommonElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const CommonElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  _CommonElevatedButtonState createState() => _CommonElevatedButtonState();
}

class _CommonElevatedButtonState extends State<CommonElevatedButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              widget.onTap();
              setState(() {
                _isLoading = false;
              });
            },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
      ),
      child: _isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE0FF64)),
                strokeWidth: 2.0,
                color: Color(0xFF333333),
              ),
            )
          : Text(widget.text),
    );
  }
}
