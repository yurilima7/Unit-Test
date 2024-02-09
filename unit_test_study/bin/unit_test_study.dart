import 'package:unit_test_study/person.dart';

void main(List<String> arguments) {
  final person = Person(name: 'James', age: 23, height: 1.77, weight: 64.4);
  print('IMC deve vir 20.56: ${person.imc == 20.56}');
  print(person.imc);
}
