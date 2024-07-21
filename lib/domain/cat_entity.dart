import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String breed;
  final String origin;
  final String description;
  final String intelligence;
  final String lifeSpan;
  final String adaptability;
  final String urlImage;
  final String id;

  const Cat({
    required this.breed,
    required this.origin,
    required this.intelligence,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.urlImage,
    required this.id
  });

  @override
  List<Object?> get props => [breed, origin, intelligence, description , lifeSpan, adaptability, urlImage, id];

}
