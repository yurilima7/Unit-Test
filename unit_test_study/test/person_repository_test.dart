import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:unit_test_study/person_repository.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  setUpAll(() {
    registerFallbackValue(Uri.parse('www.google.com.br'));
  });

  final client = ClientMock();
  final respository = PersonRepository(client);

  test('deve pegar a lista de person', () async {
    when(() => client.get(any()))
        .thenAnswer((_) async => http.Response(jsonReturn, 200));
        
    final list = await respository.getPerson();

    expect(list.isNotEmpty, equals(true));
    expect(list.first.name, 'João Silva');
  });
}

const jsonReturn = '[{"name":"João Silva","age":30,"height":1.75,"weight":75.0},{"name":"Maria Oliveira","age":25,"height":1.6,"weight":60.0},{"name":"Pedro Souza","age":40,"height":1.8,"weight":85.0},{"name":"Ana Costa","age":20,"height":1.55,"weight":55.0},{"name":"Carlos Santos","age":50,"height":1.9,"weight":95.0}]';
