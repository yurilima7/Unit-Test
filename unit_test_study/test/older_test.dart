@Timeout(Duration(seconds: 60))

import 'package:test/test.dart';
void main() {
  setUp(() {
    print('inicia o teste');
  });

  tearDown(() {
    print('destroi o teste');
  });

  setUpAll(() {
    print('inicia o suit');
  });

  tearDownAll(() {
    print('destroi o suit');
  });

  test('is worked', () {
    print('executando...');
  });

  test('is worked 2', () {
    print('executando 2...');
  });

  test('is worked 3', () {
    final name = 'James';
    expect(name, equals('James'));
    expect(name, isNotNull);
    expect(name, isA<String>());
    expect(name, contains('am'));

    expect(name, allOf([
      equals('James'),
      isNotNull,
      isA<String>(),
      contains('am'),
    ]));
  });

  test('throw error', () {
    expect(() => int.parse('x'), throwsException);
  }, timeout: Timeout(const Duration(seconds: 60)), skip: 'Falta terminar os casos de testes', tags: 'web');
}
