import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hatin/src/widget/gradient_button.dart';
import 'package:hatin/src/widget/custom_outlined_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _logo(),
            _discription(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  /// 로그인 화면 상단
  /// 아이콘들
  Widget _logo() => Flexible(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                color: Colors.black,
              )
            ],
          ),
        ),
      );

  /// 앱 중단 설명 부분
  Widget _discription() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0),
                    child: Text(
                      "Hatin",
                      style: TextStyle(
                          color: Color(0xffb9b9b9),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Text(
                    "오늘의 하루 루틴이\n내일의 성공이 될 수 있게",
                    style: TextStyle(
                      color: Color(0xff111111),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Text(
                    "더 완벽한 하루를 위해 루틴을 세워보세요.\n목표를 향한 첫 걸음을 우리와 함께해요.",
                    style: TextStyle(
                        color: Color(0xffb9b9b9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  /// 로그인 및 회원가입 버튼
  Widget _buttons() => Flexible(
        flex: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: GradientButton(
                  label: "로그인하기",
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: CustomOutlinedButton(onPressed: () {}, label: "회원가입"),
              )
            ],
          ),
        ),
      );
}