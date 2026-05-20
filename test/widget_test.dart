import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_demo/app/demo_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Counter is shared across routes', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: DemoApp()));

    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.text('加 1'));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('详情页'));
    await tester.pumpAndSettle();
    expect(find.text('当前计数: 1'), findsOneWidget);

    await tester.tap(find.text('再加 1'));
    await tester.pumpAndSettle();
    expect(find.text('当前计数: 2'), findsOneWidget);
  });
}
