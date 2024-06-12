import 'package:flutter/material.dart';

class CommonLoadingTextButton extends StatefulWidget {
  final String text;
  final Future<void> Function() onTap;

  const CommonLoadingTextButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  _CommonLoadingTextButtonState createState() =>
      _CommonLoadingTextButtonState();
}

class _CommonLoadingTextButtonState extends State<CommonLoadingTextButton>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _isLoading
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });

              try {
                await Future.any([
                  widget.onTap(),
                  Future.delayed(Duration(seconds: 10)),
                ]);
              } finally {
                setState(() {
                  _isLoading = false;
                });
              }
            },
      child: _isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            )
          : Text(
              widget.text,
            ),
    );
  }
}
