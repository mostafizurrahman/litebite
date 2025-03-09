import 'package:either_dart/either.dart';
import '../../data/model/models.dart';
import '../domain.dart';

abstract class RestaurantRepository {
  Future<Either<List<Restaurant>, ErrorEntity>> getRestaurantList();

  Future<Either<Epicure, ErrorEntity>> getEpicure(final String userID);

  Future<Either<BaseEntity, ErrorEntity>> placeOrder(
    final RestaurantOrder order,
  );

  T toEntity<T>(BaseResponse<T> response) {
    return response.toEntity();
  }
}
