import 'package:flutter/material.dart';

class NomalTextField extends StatelessWidget {
  const NomalTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffF1F3F5),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Color(0xff9B9B9B),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
