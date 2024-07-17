import 'package:flutter/cupertino.dart';

class HatinSwitch extends StatefulWidget {
  const HatinSwitch({super.key});

  @override
  State<HatinSwitch> createState() => HatinSwitchState();
}

class HatinSwitchState extends State<HatinSwitch> {
  @override
  Widget build(BuildContext context) {
    bool switchValue = true;
    return Column(
      children: [
        Transform.scale(
          scale: 1.1,
          child: CupertinoSwitch(
              // 스위치
              value: switchValue,
              onChanged: (bool value) {
                setState(() {
                  switchValue = value;
                });
              },
              activeColor: const Color(0xffFE4F28)),
        )
      ],
    );
  }
}
