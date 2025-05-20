import 'package:flutter/material.dart';

class AgeWeightWidget extends StatefulWidget {
  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;

  const AgeWeightWidget(
      {Key? key,
      required this.onChange,
      required this.title,
      required this.initValue,
      required this.min,
      required this.max})
      : super(key: key);

  @override
  _AgeWeightWidgetState createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
  }

  void _increment() {
    if (_value < widget.max) {
      setState(() {
        _value++;
      });
      widget.onChange(_value);
    }
  }

  void _decrement() {
    if (_value > widget.min) {
      setState(() {
        _value--;
      });
      widget.onChange(_value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          elevation: 12,
          margin: const EdgeInsets.all(12),
          shape: const RoundedRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(widget.title,
                    style: const TextStyle(fontSize: 25, color: Colors.grey)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _value.toString(),
                  style: const TextStyle(fontSize: 40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: _decrement,
                        icon: const Icon(Icons.remove_circle_outline)),
                    IconButton(
                        onPressed: _increment,
                        icon: const Icon(Icons.add_circle_outline))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
