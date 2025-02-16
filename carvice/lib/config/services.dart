import 'package:get_it/get_it.dart';

import '../data/data.dart';
import '../domain/domain.dart';

final service = GetIt.instance;

Future<void> initServices() async {
  service.registerFactoryParam<RestaurantDataSource, int, void>(
    _getRestaurantDataSource,
  );
  service.registerFactory<RestaurantRepository>(
    _getRestaurantRepository,
  );
  service.registerFactory<GetRestaurantUseCase>(
    _getRestaurantUC,
  );
}

RestaurantDataSource _getRestaurantDataSource(final int limit, _) {
  return RestaurantDataSource(limit: limit);
}

RestaurantRepository _getRestaurantRepository() {
  final dataSource = service.get<RestaurantDataSource>(param1: 15);
  return RestaurantRepositoryImpl(dataSource: dataSource);
}

GetRestaurantUseCase _getRestaurantUC() {
  final repository = service.get<RestaurantRepository>();
  return GetRestaurantUseCase(repository: repository);
}
