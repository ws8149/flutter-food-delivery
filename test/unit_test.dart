import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_food_delivery/blocs/FoodHomeBloc/food_home_bloc.dart';
import 'package:flutter_food_delivery/repositories/models/Food.dart';
import 'package:flutter_food_delivery/repositories/models/FoodCategory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_food_delivery/repositories/ApiService.dart';

import 'sample_api_response.dart';

class MockApiService extends Mock implements ApiService {
  Future<FoodList>  getFoodList (String category) async {
    dynamic json = jsonEncode(MOCK_FOOD_LIST);

    FoodList list = foodListFromJson(json);

    return list;
  }

  Future<FoodCategoryList>  getFoodCategory () async {
    dynamic json = jsonEncode(MOCK_FOOD_CATEGORIES);

    FoodCategoryList list = foodCategoryListFromJson(json);

    return list;
  }
}

void main() {
  late MockApiService mockApiService;
  late FoodHomeBloc foodHomeBloc;
  late FoodCategoryList mockFoodCategoryList;
  late FoodList mockFoodList;

  setUp(() async {
    mockApiService = MockApiService();
    foodHomeBloc = FoodHomeBloc(mockApiService);
    mockFoodCategoryList = await mockApiService.getFoodCategory();
    mockFoodList = await mockApiService.getFoodList("Seafood");
  });

  test('Initial State', () {
    expect(foodHomeBloc.initialState, FoodHomeLoadingState());
  });

  blocTest<FoodHomeBloc, FoodHomeState>(
      'Load Api Event',
      build: () => foodHomeBloc,
      act: (bloc) {
        bloc.add(LoadApiEvent());
      },
      expect: () => [
        FoodHomeLoadingState(),
        FoodHomeLoadedState(mockFoodCategoryList, mockFoodList),
      ],
  );

}