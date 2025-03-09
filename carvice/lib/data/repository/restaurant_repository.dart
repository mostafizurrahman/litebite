import 'package:carvice/data/model/models.dart';
import 'package:either_dart/either.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';
import '../../domain/repository/abstract_base_repository.dart';
import 'restaurant_datasource.dart';

class RestaurantRepositoryImpl extends RestaurantRepository
with ErrorRepositoryMixin
    {
  final RestaurantDataSource dataSource;

  RestaurantRepositoryImpl({required this.dataSource});

  Future<Either<List<Restaurant>, ErrorEntity>> getRestaurantList() async {
    // try {
      final data = await dataSource.getRestaurantListResponse();
      final restaurants = data.map(toEntity).toList();
      return Left(restaurants);
    // } catch (ex) {
    //   final error = super.getBaseError(ex);
    //   return Right(error);
    // }
  }

  @override
  Future<Either<Epicure, ErrorEntity>> getEpicure(final String userID) async {
    final data = await dataSource.getUserBy(userID: userID);
    final entity = toEntity(data!);
    return Left(entity);
  }
/*
FirebaseFirestore.instance
    .collection('users')
    .doc(userId)
    .collection('orders')
    .orderBy('created_at', descending: true)
    .get();

 */
  @override
  Future<Either<BaseEntity, ErrorEntity>> placeOrder(RestaurantOrder order) async {
    // TODO: implement placeOrder
    throw UnimplementedError();
  }


}
