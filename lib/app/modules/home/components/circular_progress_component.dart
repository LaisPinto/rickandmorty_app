import 'package:flutter/material.dart';

class CircularProgressComponent extends StatelessWidget {
  final String label;
  const CircularProgressComponent({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          Text(label),
        ],
      ),
    );
  }
}
