import 'package:flutter/material.dart';
import 'package:hatin/src/widget/service_button.dart';
import 'package:hatin/src/widget/service_switch_button.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: _body(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 40,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none_outlined,
            size: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _userInfo(),
          _follow(),
          _post(),
          _friendsManager(),
          _customerService(),
        ],
      ),
    );
  }

  Widget _userInfo() {
    return Container(
      width: double.infinity,
      height: 70,
      color: Colors.white,
      child: const Column(
        children: [
          Row(
            children: [
              Text(
                "바른생활김덕인",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 24,
              ),
            ],
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "induk@gmail.com",
                style: TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
              )),
        ],
      ),
    );
  }

  Widget _follow() {
    return const Center(
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "팔로워",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "|",
                    style: TextStyle(color: Color(0xff9B9B9B)),
                  ),
                  Text(
                    "팔로잉",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "76",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "77",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _post() {
    return const SizedBox(
      width: double.infinity,
      height: 150,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "게시글 관리",
                style: TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
              )),
          ServiceButton(label: "내 게시글"),
          ServiceButton(label: "내 댓글"),
        ],
      ),
    );
  }

  Widget _friendsManager() {
    return const SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "친구 관리",
                style: TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
              )),
          ServiceButton(label: "차단 관리"),
          ServiceSwitchButton(label: "팔로우 허락 받기"),
          ServiceSwitchButton(label: "알림 받기"),
        ],
      ),
    );
  }

  Widget _customerService() {
    return const Center(
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "고객 센터",
                  style: TextStyle(fontSize: 14, color: Color(0xff9B9B9B)),
                )),
            ServiceButton(label: "문의하기"),
          ],
        ),
      ),
    );
  }
}
