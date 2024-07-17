import 'package:flutter/material.dart';
import 'package:hatin/src/ui/app/app_view_model.dart';
import 'package:hatin/src/ui/home/home_view.dart';
import 'package:hatin/src/ui/my_page/my_page.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
import 'package:hatin/src/widget/hattin_image_icon.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
      extendBody: true,
    );
  }

  Widget _body() => Consumer<AppViewModel>(
        builder: (context, provider, child) => IndexedStack(
          index: provider.pageIndex,
          children: [
            const HomeView(),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.green,
            ),
            const MyPage(),
          ],
        ),
      );

  Widget _bottomNavigationBar() =>
      (!Provider.of<RoutinViewModel>(context).isEdit)
          ? Consumer<AppViewModel>(builder: (context, provider, child) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                child: BottomNavigationBar(
                    key: const Key("AppBottomNav"),
                    backgroundColor: Colors.white,
                    currentIndex: provider.pageIndex,
                    onTap: provider.changeIndex,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                          icon: HattinImageIcon(path: ImagePath.homeOff),
                          activeIcon: HattinImageIcon(path: ImagePath.homeOn),
                          label: "Home"),
                      BottomNavigationBarItem(
                          icon: HattinImageIcon(path: ImagePath.routinOff),
                          activeIcon: HattinImageIcon(path: ImagePath.routinOn),
                          label: "Rotin"),
                      BottomNavigationBarItem(
                          icon: HattinImageIcon(path: ImagePath.feedOff),
                          activeIcon: HattinImageIcon(path: ImagePath.feedOn),
                          label: "Feed"),
                      BottomNavigationBarItem(
                          icon: HattinImageIcon(path: ImagePath.mypageOff),
                          activeIcon: HattinImageIcon(path: ImagePath.mypageOn),
                          label: "MyPage"),
                    ]),
              );
            })
          : GestureDetector(
              key: const Key("RoutinDelBtn"),
              onTap: () {
                Provider.of<RoutinViewModel>(context, listen: false)
                    .showDeleteDialog(context);
              },
              child: Container(
                height: 88,
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: Colors.white),
                child: const SafeArea(
                  child: Text(
                    "삭제",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFE4F28)),
                  ),
                ),
              ),
            );
}
