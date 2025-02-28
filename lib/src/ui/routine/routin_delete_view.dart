import 'package:flutter/material.dart';
import 'package:hatin/src/model/routin.dart';
import 'package:hatin/src/ui/routine/routin_view_model.dart';
import 'package:provider/provider.dart';

class RoutinDeleteView extends StatefulWidget {
  const RoutinDeleteView({super.key});

  @override
  State<RoutinDeleteView> createState() => _RoutinDeleteViewState();
}

class _RoutinDeleteViewState extends State<RoutinDeleteView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RoutinViewModel>(
        builder: (context, provider, child) => SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height * 4 + 8,
                ),
                ...List.generate(provider.routins.length, (index) {
                  final Routin routin = provider.routins[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4.0),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                                checkColor: const Color(0xffFE4F28),
                                value: routin.isCheck,
                                onChanged: (value) {
                                  provider.check(value, index);
                                }),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  routin.name,
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  routin.startAt,
                                  style:
                                      const TextStyle(color: Color(0xffb9b9b9)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
              ],
            )));
  }
}
