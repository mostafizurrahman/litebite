


import 'package:carvice/config/services.dart';
import 'package:carvice/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantInitState());


  Future<void> getRestaurantList() async {
    emit(RestaurantInitState());
    final repository = service.get<RestaurantRepository>();
    final useCase = GetRestaurantUseCase(repository: repository);
    final either = await useCase.call(EmptyInput());
    if (either.isLeft) {
      final state = RestaurantListState(restaurants: either.left);
      emit(state);
    } else {
      final state = RestaurantListErrorState(reason: either.right.errorReason);
      emit(state);
    }
  }
}