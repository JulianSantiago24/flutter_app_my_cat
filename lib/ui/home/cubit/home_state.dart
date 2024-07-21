part of 'home_cubit.dart';

class HomeState {
  final List<Cat>? catList;
  final Cat? searchResult;
  final String? queryParameters;
  final bool? isActiveSearch;

  HomeState({this.isActiveSearch, this.searchResult, this.queryParameters, this.catList});

  HomeState copywith({
    List<Cat>? catList,
    Cat? searchResult,
    String? queryParameters,
    bool? isActiveSearch,  }) => HomeState(
    catList: catList ?? this.catList,
    searchResult: searchResult,
    queryParameters: queryParameters ?? this.queryParameters,
    isActiveSearch: isActiveSearch ?? this.isActiveSearch
  );
}
