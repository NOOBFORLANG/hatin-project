import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hatin/src/ui/onboard/onboard_view.dart';
import 'package:hatin/src/ui/routine/routin_page.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  var now = DateTime.now();
  late final startOfWeek;
  final _weekDay = [
    "월",
    "화",
    "수",
    "목",
    "금",
    "토",
    "일",
  ];
  late final TabController _tabController;

  @override
  void initState() {
    // 탭바를 사용하려면 initState 가 필요함.
    super.initState();
    _tabController = TabController(
      length: _weekDay.length,
      vsync: this,
      initialIndex: now.weekday - 1,
    );
    startOfWeek = now.day - (now.weekday - 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      extendBodyBehindAppBar: true,
    );
  }

  PreferredSize _appBar() => PreferredSize(
        preferredSize: (Provider.of<RoutinViewModel>(context).isEdit)
            ? (AppBar().preferredSize * 3)
            : (AppBar().preferredSize * 2),
        child: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(32.0)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15.0,
              sigmaY: 15.0,
            ),
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white.withOpacity(0.75),
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(32.0))),
              centerTitle: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(DateFormat("yyyy년 M월 d일").format(DateTime.now())),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OnboardView()));
                    },
                    child: const Text(
                      "로그인/회원가입",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ),
                ],
              ),
              bottom: _tabBar(),
            ),
          ),
        ),
      );

  PreferredSize _tabBar() {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            TabBar(
              labelPadding: EdgeInsets.zero,
              onTap: (value) {
                if (Provider.of<RoutinViewModel>(context, listen: false)
                    .isEdit) {
                  Provider.of<RoutinViewModel>(context, listen: false).edit();
                }
              },
              controller: _tabController,
              indicator: const BoxDecoration(color: Color(0xffFFC6B9)),
              labelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
              tabs: List.generate(
                  _weekDay.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                _weekDay[index],
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                (startOfWeek + index).toString(),
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      )),
            ),
            _edit()
          ],
        ),
      ),
    );
  }

  Widget _edit() =>
      Consumer<RoutinViewModel>(builder: (context, provider, child) {
        return (provider.isEdit)
            ? SizedBox(
                key: const Key("RoutinSelectTool"),
                height: AppBar().preferredSize.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          const Text(
                            "선택",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff111111)),
                          ),
                          GestureDetector(
                            key: const Key("allSelectTextBtn"),
                            onTap: provider.allSelect,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                "전체선택",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xffb9b9b9)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: Provider.of<RoutinViewModel>(context).edit,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "취소",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffb9b9b9)),
                          ),
                        ))
                  ],
                ),
              )
            : Container();
      });

  Widget _body() => TabBarView(
      controller: _tabController,
      children: List.generate(7, (index) => const RoutinPage()));
}
