import 'package:flutter/material.dart';
import 'package:hatin/src/widget/hatin_switch.dart';

class ServiceSwitchButton extends StatelessWidget {
  final String label;

  const ServiceSwitchButton({
    super.key,
    required this.label,
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
        const HatinSwitch(),
      ],
    );
  }
}
