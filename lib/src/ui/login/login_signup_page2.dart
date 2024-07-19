import 'package:flutter/material.dart';

class LoginSignup2 extends StatelessWidget {
  const LoginSignup2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _signuptext(),
          _signupemail(),
          _signupckpassword(),
          _btnnextsignup(),
        ],
      ),
    );
  }

  Widget _signuptext() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.circle,
              color: Color(0xffE5E5E5),
            ),
            Text(
              "회원가입",
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _signupemail() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text("휴대폰 번호 (-제외)"),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffE5E5E5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "01012345678",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signupckpassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        children: [
          const SizedBox(width: double.infinity, child: Text("생년월일")),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffE5E5E5),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "2024.01.01",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnnextsignup() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
