## Testes de unidade

```dart
group('Bankmodel deposit tests', () {
    test('Bank model deposit should turn points into 10', () {
      var bank = BankModel();
      bank.deposit(10);
      expect(bank.points, 10);
    });
    test('Bank model deposit should turn available into 10', () {
      var bank = BankModel();
      bank.deposit(10);
      expect(bank.available, 10);
    });
  });
```
```dart
test('Bank model transfer should turn points into 10', () {
    var bank = BankModel();
    bank.deposit(10);
    expect(bank.points, 10);
  });
```

## Testes de widget
```dart
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
```
```dart
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
```
```dart
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
```
```dart
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
```
```dart
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
```
```dart

```
