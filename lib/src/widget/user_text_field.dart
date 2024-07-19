import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;

  const UserTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffF1F3F5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                obscureText: isPassword,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Color(0xff9B9B9B),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
