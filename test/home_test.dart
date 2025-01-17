import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("My widget has a text 'Spent' ", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: const Home(),
        ),
      ),
    );
    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);
  });

  testWidgets("finds a LinearProgressIndicator", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: const Home(),
        ),
      ),
    );
    final progressIndicator = find.byType(LinearProgressIndicator);
    expect(progressIndicator, findsOneWidget);
  });
  testWidgets("finds a AccountStatus", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: const Home(),
        ),
      ),
    );
    final progressIndicator = find.byKey(const Key('testKey'));
    expect(progressIndicator, findsOneWidget);
  });

  testWidgets("finds 5 BoxCards", (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: const Home(),
        ),
      ),
    );
    final boxCard = find.byWidgetPredicate((widget) {
      if (widget is BoxCard) {
        return true;
      } else {
        return false;
      }
    });
    expect(boxCard, findsNWidgets(5));
  });

  testWidgets('When tap Deposit should upload earned in 10', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: const Home(),
        ),
      ),
    );

    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));
    await tester.pumpAndSettle(); // esperar microserviços
    expect(find.text('\$10.0'), findsOneWidget);
  });
}
