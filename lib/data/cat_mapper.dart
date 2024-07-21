import 'package:flutter_app_my_cat/data/cat_breed_model.dart';
import 'package:flutter_app_my_cat/domain/cat_entity.dart';

class MapperCat {
  static Cat catModelToCatEntity(CatBreedModel catModel){
    return Cat(
    breed: catModel.name,
    origin: catModel.origin,
    intelligence: catModel.intelligence.toString(),
    description: catModel.description,
    lifeSpan: catModel.lifeSpan,
    adaptability: catModel.adaptability.toString(),
    urlImage:'https://cdn2.thecatapi.com/images/${catModel.referenceImageId}.jpg',
    id: catModel.id);
  }
}
