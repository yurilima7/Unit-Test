import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:unit_test_study/person.dart';

void main() {
  final person = Person(name: 'James', age: 23, height: 1.77, weight: 64.4);

  test('IMC deve vir 20.56', () => {
    expect(person.imc, 20.56),
  });

  group('isOlder | ', () {
    test('Se a idade for maior que 18, então isOlder deve ser true', () {
      expect(person.isOlder, true);
    });

    test('Se a idade for igual a 18, então isOlder deve ser true', () {
      final person = Person(name: 'James', age: 18, height: 1.77, weight: 64.4);
      expect(person.isOlder, true);
    });
  });

}
