

import 'package:either_dart/either.dart';

import '../domain.dart';


abstract class RestaurantRepository {
  Future<Either<List<Restaurant>, ErrorEntity>> getRestaurantList();
  Future<Either<List<Epicure>, ErrorEntity>> getEpicure(final String userID);

}