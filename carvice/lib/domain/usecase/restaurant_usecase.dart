import 'package:either_dart/either.dart';

import '../domain.dart';
import 'abstract_usecase.dart';
typedef RestListEither = Either<List<Restaurant>, ErrorEntity>;
class GetRestaurantUseCase
    extends BaseUseCase<RestListEither, void> {
  final RestaurantRepository repository;

  GetRestaurantUseCase({required this.repository});

  @override
  Future<RestListEither> call(input) async {
    final eitherData = await repository.getRestaurantList();
    return eitherData;
  }
}
