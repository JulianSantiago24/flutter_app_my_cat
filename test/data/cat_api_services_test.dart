
import 'package:flutter_app_my_cat/data/cat_api_services.dart';
import 'package:flutter_app_my_cat/domain/cat_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockApiServiceCatBreeds extends Mock implements ApiServiceCatBreeds {}
class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockApiServiceCatBreeds mockApiServiceCatBreeds;
  late MockHttpClient mockHttpClient;

  setUpAll(() {
    registerFallbackValue(MockHttpClient());
  });

  setUp(() {
    mockApiServiceCatBreeds = MockApiServiceCatBreeds();
    mockHttpClient = MockHttpClient();
  });

  test('Test getCatBreeds get successfully', () async {

    // Arrange
    const cat = Cat(breed: 'breed', origin: 'origin', intelligence: 'intelligence', description: 'description', lifeSpan: 'lifeSpan', adaptability: 'adaptability', urlImage: 'urlImage', id: 'id');
    final fakeResponse =  Future.value([cat]);
    when(() => mockApiServiceCatBreeds.getCatBreeds(mockHttpClient)).thenAnswer((_) => fakeResponse);

    // Act
    final result = ApiServiceCatBreeds().getCatBreeds(mockHttpClient);

    // Assert
    expect(result, isA<Future<List<Cat>>>());
    expect(result, equals(fakeResponse));
    verify(() => mockApiServiceCatBreeds.getCatBreeds(mockHttpClient)).called(1);
  });
}
