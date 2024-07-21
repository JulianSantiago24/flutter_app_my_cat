import 'package:flutter_app_my_cat/data/cat_mapper.dart';
import 'package:flutter_app_my_cat/data/cat_breed_model.dart';
import 'package:flutter_app_my_cat/domain/cat_breeds_repository.dart';
import 'package:flutter_app_my_cat/domain/cat_entity.dart';
import 'package:http/http.dart';

enum FetchCatBreedsError {
  notFound,
  serverError,
  unknown,
}

class FetchCatBreedsException implements Exception {
  final FetchCatBreedsError error;
  final String message;

  FetchCatBreedsException(this.error, this.message);

  @override
  String toString() => 'FetchCatBreedsException: $message';
}


class ApiServiceCatBreeds extends CatBreedsRepository {

  ApiServiceCatBreeds._private();

  static final ApiServiceCatBreeds _singleton = ApiServiceCatBreeds._private();

  factory ApiServiceCatBreeds() {
    return _singleton;
  }


  Future<List<CatBreedModel>> _fetchCatBreeds(Client httpClient) async {
    final response = await httpClient.get(
      Uri.parse('https://api.thecatapi.com/v1/breeds'),
      headers: {'x-api-key': 'ive_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr'} //TODO Organizar mejor el API Key
    );

    if (response.statusCode == 200) {
      return catBreedModelFromJson(response.body);
    } else {
      switch (response.statusCode) {
        case 404:
          throw FetchCatBreedsException(
            FetchCatBreedsError.notFound,
            'Breeds list not found'
          );
        case 500:
          throw FetchCatBreedsException(
            FetchCatBreedsError.serverError,
            'Server error'
          );
        default:
          throw FetchCatBreedsException(
            FetchCatBreedsError.unknown,
            'Failed to load Breeds list (code: ${response.statusCode})'
          );
      }
    }
  }

  @override
  Future<List<Cat>> getCatBreeds(Client httpClient) async{
    final resultModel = await _fetchCatBreeds(httpClient);
    final List<Cat> cats = resultModel.map((CatBreedModel catModel) => MapperCat.catModelToCatEntity(catModel)).toList();
    return cats;
  }
}
