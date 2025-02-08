

import 'package:either_dart/either.dart';

import '../domain.dart';


abstract class RestaurantRepository {
  Future<Either<List<Restaurant>, ErrorEntity>> getRestaurantList();

}