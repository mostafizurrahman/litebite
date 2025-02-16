

import 'package:carvice/config/services.dart';
import 'package:carvice/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecase/epicure_usecase.dart';
import 'epicure_states.dart';


class EpicureCubit extends Cubit<EpicureState> {
  EpicureCubit() : super(EpicureInitState());


  Future<void> getEpicureBy({required String userID}) async {
    emit(EpicureInitState());
    final repository = service.get<RestaurantRepository>();
    final useCase = GetEpicureUseCase(repository: repository);
    final either = await useCase.call(userID);
    if (either.isLeft) {
      final state = EpicureInfState(epicure: either.left);
      emit(state);
    } else {
      final state = EpicureListErrorState(reason: either.right.errorReason);
      emit(state);
    }
  }
}