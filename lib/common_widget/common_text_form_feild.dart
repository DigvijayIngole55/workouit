import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    this.label,
    this.isPassword = false,
    this.suffixIcon,
    this.onTap,
    this.regexPattern,
    this.errorMessage,
  });

  final TextEditingController controller;
  final String? label;
  final bool isPassword;
  final Icon? suffixIcon;
  final VoidCallback? onTap;
  final String? regexPattern;
  final String? errorMessage;

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _obscureText = true;

  String? _validate(String? value) {
    if (widget.regexPattern != null && widget.errorMessage != null) {
      final regex = RegExp(widget.regexPattern!);
      if (!regex.hasMatch(value ?? '')) {
        return widget.errorMessage;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
      ),
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      onTap: widget.onTap,
      validator: _validate,
    );
  }
}
