import 'dart:convert';
import 'dart:math' as math;

class Person {
  final String name;
  final int age;
  final double height;
  final double weight;

  Person({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });

  double get imc {
    var result = weight / math.pow(height, 2);
    result *= 100;
    return result.roundToDouble() / 100;
  }

  bool get isOlder {
    return age >= 18;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
      age: map['age'] as int,
      height: map['height'] as double,
      weight: map['weight'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source) as Map<String, dynamic>);
}
