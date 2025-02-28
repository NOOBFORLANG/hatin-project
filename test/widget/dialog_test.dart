import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hatin/src/widget/hatin_dialog.dart';

void main() {
  group("Hatin Dialog UI 테스트", () {
    testWidgets("구성 컴포넌트 테스트", (widgetTester) async {
      Widget createHatinDialog() => MaterialApp(
            home: Scaffold(
              body: HatinDialog(
                content: const ["content"],
                onCancel: () {},
                onCommit: () {},
              ),
            ),
          );
      await widgetTester.pumpWidget(createHatinDialog());
      expect(find.text("content"), findsOneWidget);
    });

    testWidgets("확인, 취소 액션을 할당하지 않은 경우 assert가 실행된다..", (widgetTester) async {
      builderA() => HatinDialog(
            content: const ["content"],
          );
      builderB() => HatinDialog(
            content: const ["content"],
            onCancel: () {},
          );
      builderC() => HatinDialog(
            content: const ["content"],
            onCommit: () {},
          );

      expect(() => builderA(), throwsAssertionError);
      expect(() => builderB(), throwsAssertionError);
      expect(() => builderC(), throwsAssertionError);
    });

    testWidgets("확인, 취소 버튼을 탭하면 액션이 실행된다.", (widgetTester) async {
      final List<String> log = [];
      Widget createHatinDialog() => MaterialApp(
            home: Scaffold(
              body: HatinDialog(
                content: const ["content"],
                onCancel: () {
                  log.add("Cancel");
                },
                onCommit: () {
                  log.add("Commit");
                },
              ),
            ),
          );
      await widgetTester.pumpWidget(createHatinDialog());
      await widgetTester.tap(find.text("확인"));
      expect(log.length, 1);
      expect(log.last, "Commit");
      await widgetTester.tap(find.text("취소"));
      expect(log.length, 2);
      expect(log.last, "Cancel");
    });

    testWidgets("확인, 취소 버튼의 Label은 변경이 가능하다.", (widgetTester) async {
      Widget createHatinDialog() => MaterialApp(
            home: Scaffold(
              body: HatinDialog(
                content: const ["content"],
                onCancel: () {},
                cancelLabel: "취소변경",
                onCommit: () {},
                commitLabel: "확인변경",
              ),
            ),
          );

      await widgetTester.pumpWidget(createHatinDialog());
      expect(find.text("확인변경"), findsOneWidget);
      expect(find.text("취소변경"), findsOneWidget);
    });
  });
}
