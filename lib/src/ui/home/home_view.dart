import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            child: Container(
              decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                    blurStyle: BlurStyle.normal)
              ]),
              child: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white.withOpacity(0.75),
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(32.0))),
                centerTitle: false,
                title: Text(DateFormat("yyyy년 M월 d일").format(DateTime.now())),
                bottom: _tabBar(),
              ),
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
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                (startOfWeek + index).toString(),
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
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
      Consumer<RoutinViewModel>(builder: (context, provder, child) {
        return (provder.isEdit)
            ? SizedBox(
                height: AppBar().preferredSize.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Row(
                        children: [Text("선택"), Text("전체선택")],
                      ),
                    ),
                    GestureDetector(
                        onTap: Provider.of<RoutinViewModel>(context).edit,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("취소"),
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
