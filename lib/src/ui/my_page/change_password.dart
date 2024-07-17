import 'package:flutter/material.dart';
import 'package:hatin/src/ui/my_page/change_user_info.dart';
import 'package:hatin/src/widget/user_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _body(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text("비밀번호 변경"),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const UserTextField(
            label: "비밀번호를 입력하여 인증을 진행해주세요.",
            hintText: "",
            isPassword: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: BlackButton(label: "인증하기", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
