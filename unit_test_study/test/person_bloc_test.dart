import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:unit_test_study/person.dart';
import 'package:unit_test_study/person_bloc.dart';
import 'package:unit_test_study/person_repository.dart';
import 'package:unit_test_study/person_state.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

void main() {
  final repository = PersonRepositoryMock();
  final bloc = PersonBloc(repository);
  final person = Person(name: 'James', age: 23, height: 1.77, weight: 64.4);
  
  test('deve retornar uma lista de person', () async {
    when(() => repository.getPerson())
        .thenAnswer((_) async => <Person>[person, person]);

    bloc.add(PersonEvent.fetch);

    await expectLater(bloc, emitsInOrder([
      isA<PersonLoadingState>(),
      isA<PersonListState>(),
    ]));
  });
  
  test('deve disparar um erro', () async {
    when(() => repository.getPerson())
        .thenThrow((_) async => Exception('Deu erro'));

    bloc.add(PersonEvent.fetch);

    await expectLater(bloc, emitsInOrder([
      isA<PersonLoadingState>(),
      isA<PersonErrorState>(),
    ]));
  });
}
