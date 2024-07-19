import 'package:flutter/material.dart';
import 'package:hatin/src/widget/nomal_text_field.dart';
import 'package:hatin/src/widget/select_button.dart';
import 'package:hatin/src/widget/user_text_field.dart';
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
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: _body()),
          _bottomButton(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("회원정보 변경"),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _changeEmail(),
            _changeGender(),
            _changeBirthday(),
            _changeAddress(),
            _changePhoneNumber(),
          ],
        ),
      ),
    );
  }

  Widget _changeEmail() {
    return UserTextFieldButton(
        label: "이메일", buttonTitle: "중복확인", onButtonPressed: () {});
  }

  Widget _changeGender() {
    return const SelectButton();
  }

  Widget _changeBirthday() {
    return const UserTextField(label: "생년월일", hintText: "", isPassword: false);
  }

  Widget _changeAddress() {
    return Column(
      children: [
        UserTextFieldButton(
            label: "주소", buttonTitle: "검색", onButtonPressed: () {}),
        const NomalTextField(),
        const NomalTextField(),
      ],
    );
  }

  Widget _changePhoneNumber() {
    return UserTextFieldButton(
        label: "전화번호 ( - 제외 )", buttonTitle: "중복확인", onButtonPressed: () {});
  }

  Widget _bottomButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: BlackButton(
        label: "변경하기",
        onPressed: () {},
      ),
    );
  }
}

class BlackButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const BlackButton({super.key, this.onPressed, required this.label})
      : assert(onPressed != null, "액션 함수를 반드시 지정해야 합니다 onPressed is Null");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      highlightColor: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(36.0),
      child: Ink(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.0),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
