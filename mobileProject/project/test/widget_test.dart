import 'package:flutter_test/flutter_test.dart';

import 'package:project/main.dart';

void main() {
  testWidgets('SENAI Stock app starts on dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Dashboard'), findsWidgets);
    expect(find.text('Livros'), findsWidgets);
    expect(find.text('SENAI User'), findsOneWidget);
    expect(find.text('Exemplares'), findsOneWidget);
    expect(find.text('Ultimas requisicoes'), findsOneWidget);
  });
}
