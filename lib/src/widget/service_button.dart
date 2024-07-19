import 'package:flutter/material.dart';

class ServiceButton extends StatelessWidget {
  final String label;
  final VoidCallback onButtonPressed;

  const ServiceButton({
    super.key,
    required this.label,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        IconButton(
          onPressed: onButtonPressed,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
