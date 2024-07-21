
import 'package:bloc/bloc.dart';
import 'package:flutter_app_my_cat/data/cat_api_services.dart';
import 'package:flutter_app_my_cat/domain/cat_entity.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeState());

  List<Cat>? cats;
  List<Cat>? searchCatBreedslist;

  void initHomeCubitState() async {
    getBreeds();
  }

  void getBreeds() async {
    cats = await ApiServiceCatBreeds().getCatBreeds(http.Client());
    emit(state.copywith(catList: cats));
  }

  void searchBreed(String text){
    final filterLowerCase = text.toLowerCase();
    if (text == '') {
      getBreeds();
    } else {
      searchCatBreedslist = List<Cat>.from(
        cats!.where(
          (element) => element.breed.toLowerCase().contains(filterLowerCase)
        )
      );
      emit(state.copywith(catList: searchCatBreedslist));
    }
  }
}
