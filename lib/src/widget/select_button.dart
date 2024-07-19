import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool _isFemaleSelected = false;
  bool _isMaleSelected = false;

  void _onFemalePressed() {
    setState(() {
      _isFemaleSelected = true;
      _isMaleSelected = false;
    });
  }

  void _onMalePressed() {
    setState(() {
      _isFemaleSelected = false;
      _isMaleSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "성별",
                  style: TextStyle(fontSize: 16),
                ),
              )),
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: _isFemaleSelected
                        ? Colors.black
                        : const Color(0xffF1F3F5),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextButton(
                    onPressed: _onFemalePressed,
                    child: Text(
                      "여자",
                      style: TextStyle(
                          color: _isFemaleSelected ? Colors.white : Colors.grey,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color:
                      _isMaleSelected ? Colors.black : const Color(0xffF1F3F5),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextButton(
                  onPressed: _onMalePressed,
                  child: Text(
                    "남자",
                    style: TextStyle(
                        color: _isMaleSelected ? Colors.white : Colors.grey,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
