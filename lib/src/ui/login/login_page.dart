import 'package:flutter/material.dart';
import 'package:hatin/src/widget/gradient_button.dart';
import 'package:hatin/src/widget/user_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
        ),
        elevation: 0,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            _text(),
            const UserTextField(
                label: "아이디", hintText: "아이디를 입력해주세요.", isPassword: false),
            _findid(),
            const UserTextField(
                label: "비밀번호", hintText: "비밀번호를 입력해주세요.", isPassword: true),
            _findpassword(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: GradientButton(
                label: "로그인하기",
                onPressed: () {},
              ),
            ),
            btnSignup(),
          ],
        ),
      ),
    );
  }

  Widget _text() {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 100,
      child: const Text(
        "로그인",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Color(0xff111111),
        ),
      ),
    );
  }

  Widget _findid() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "아이디 기억하기",
          style: TextStyle(
            color: Color(0xff9B9B9B),
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "아이디 찾기",
            style: TextStyle(
              color: Color(0xff9B9B9B),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _findpassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "비밀번호를 잊으셨나요?",
          style: TextStyle(
            color: Color(0xff9B9B9B),
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "비밀번호 찾기",
            style: TextStyle(
              color: Color(0xff9B9B9B),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget btnSignup() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "아이디가 없으신가요?",
            style: TextStyle(fontSize: 16, color: Color(0xff9B9B9B)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "회원가입",
              style: TextStyle(fontSize: 16, color: Color(0xff9b9b9b)),
            ),
          ),
        ],
      ),
    );
  }
}
