import 'package:flutter_app_my_cat/domain/cat_entity.dart';
import 'package:http/http.dart';

abstract class CatBreedsRepository {
  Future<List<Cat>> getCatBreeds(Client httpClient);
}
