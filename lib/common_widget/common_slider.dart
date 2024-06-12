import 'package:flutter/material.dart';

class CommonSlider extends StatefulWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;

  const CommonSlider({
    super.key,
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  @override
  _CommonSliderState createState() => _CommonSliderState();
}

class _CommonSliderState extends State<CommonSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            widget.label,
          ),
        ),
        Slider(
          value: _currentValue,
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          label: _currentValue.round().toString(),
          onChanged: (value) {
            setState(() {
              _currentValue = value;
            });
            widget.onChanged(value);
          },
        ),
        Center(
          child: Text(
            _currentValue.toString(),
          ),
        ),
      ],
    );
  }
}
