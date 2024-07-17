import 'package:flutter/material.dart';
import 'package:hatin/src/widget/service_button.dart';
import 'package:hatin/src/widget/user_text_field_button.dart';

class ChangeUserInfo extends StatefulWidget {
  const ChangeUserInfo({super.key});

  @override
  State<ChangeUserInfo> createState() => _ChangeUserInfoState();
}

class _ChangeUserInfoState extends State<ChangeUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(child: _body()),
            _deleteAccount(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 24,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserTextFieldButton(
              label: "닉네임 변경", buttonTitle: "변경 ", onButtonPressed: () {}),
          const ServiceButton(label: "회원정보 변경"),
          const ServiceButton(label: "비밀번호 변경"),
        ],
      ),
    );
  }

  Widget _deleteAccount() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 200,
      child: TextButton(
        onPressed: () {},
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "계정 삭제",
            style: TextStyle(fontSize: 16), // 선택적으로 스타일 추가
          ),
        ),
      ),
    );
  }
}
