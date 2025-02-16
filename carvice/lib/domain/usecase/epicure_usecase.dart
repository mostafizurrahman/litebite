import 'package:either_dart/either.dart';

import '../domain.dart';
import 'abstract_usecase.dart';

typedef EpicureEither = Either<Epicure, ErrorEntity>;

class GetEpicureUseCase extends BaseUseCase<EpicureEither, String> {
  final RestaurantRepository repository;

  GetEpicureUseCase({required this.repository});

  @override
  Future<EpicureEither> call(String input) async {
    final eitherData = await repository.getEpicure(input);
    return eitherData;
  }
}
