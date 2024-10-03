testes na produção
    grandes aplicações
    melhor aparecer bug para você enquanto desenvolve do que para o cliente
    testes são essenciais
    garantir qualidade do software


tipos de testes:
    testes de unidades
        simples
        testar uma classe
        partes pequenas
        testar um objeto
    testes de widgets
        componentes
        testas ações
    testes de integração
        completo
        testes de fluxo
        testes longos e complexo

confiança aumenta
custo aumenta
velocidade diminui


descrição - 3 informações:
    nome do metodo
    cenario 
    resultado


(lembre-se não existem testes demais)    

A função expect() precisa de um actual e de um matcher
    O actual é o valor da variável atual e o matcher é o valor esperado dessa variável.

Exemplo
```dart
test('Bank model transfer should turn Spent into 10', (){
  final bank = BankModel();
  bank.transfer(10);
  expect(bank.spent, 10);
});    
```    

Pasta `/Test`
    pasta destinada apenas aos testes

`test()`
    função herdada do pacote `import 'package:flutter_test/flutter_test.dart';`
    teste simples de unidade

`expect()`
    comparar o valor da variável com o valor esperado

`group()`
    agrupa diversos testes

**testes de unidade, não testes unitários**    

## testes manuais e automatizados

robo que testa em todos os locais
automatizados
    mais velozes

testes de widget automatizados    

Home(): widget mais completo nesse caso

`testWidgets()`

```dart
testWidgets("", (tester) async {
    await tester.pumpWidget()   // desenhar widget na tela
}
```

Matcher:
    findsNothing
    findsWidgets
    findsNWidgets

    findsOneWidget

```dart
testWidgets('My widget has a text "Deposit" ', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(),
      ),
    ));
    final spentFinder = find.text('Deposit');
    expect(spentFinder, findsOneWidget);
  });
```

Teste Automatizado Vs Teste Manual:
- teste Manual: feito pelo desenvolvedor, ao alterar o código e verificar se de fato o projeto seguiu o desejado )
- teste automatizado: feito pelo framework e é extremamente veloz e eficiente).

Testes de Widgets:
precisam ser renderizados em uma tela emulada para a verificação de elementos desenhados

`pump():`
Método capaz de esperar pelos microprocessos necessários para buildar/renderizar/desenhar na tela os elementos dos Widgets.

`Finders`:
Nome dado aos métodos capazes de buscar, na tela renderizada, os Widgets desejados, utilizando diversas abordagens de procura, como tipo de Widget, qual sua chave, entre outros.

`Matcher`:
podemos verificar quantos Widgets existem na tela e quais os parâmetros que confirmam que de fato aquele Widget é o procurado. Os Matchers são responsáveis por essa comparação.

**Testar ações no código**:
Quando testamos nosso aplicativos, nos deparamos com ações de interação com botões, caixas de texto, scrollables entre outros. As ações são instruções que damos ao nosso tester para interagir com certos Widgets a fim de verificar sua usabilidade.

**Testes do flutter não testa conexões externas**

testes não confiáveis
não depende do projeto

Dubles
    simulam ações e testar sem ter problemas

    Mocks
        pacote 'mockito'
        criar novo mock
            @GenerateMocks([BankHttp])

        pacote de desenvolvimento
            pacote 'build_runner'

    terminal:
    `flutter pub run build_runner build`

Mock é usado para criar um dublê de dependências externas (como API’s ou bancos de dados fora do projeto) e que ele evita que tenhamos flaky tests.