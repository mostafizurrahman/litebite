import 'package:either_dart/either.dart';

import '../domain.dart';
import 'abstract_usecase.dart';

typedef EpicureListEither = Either<List<Epicure>, ErrorEntity>;

class EpicureUseCase extends BaseUseCase<EpicureListEither, String> {
  final RestaurantRepository repository;

  EpicureUseCase({required this.repository});

  @override
  Future<EpicureListEither> call(String input) async {
    final eitherData = await repository.getEpicure(input);
    return eitherData;
  }
}
