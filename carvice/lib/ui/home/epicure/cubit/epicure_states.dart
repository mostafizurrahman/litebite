import 'package:carvice/domain/domain.dart';

abstract class EpicureState {
  final List<Object> properties = [];

  @override
  String toString() => 'EpicureState ${DateTime.now()}';
}

class EpicureInitState extends EpicureState {}

class EpicureInfState extends EpicureState {
  final Epicure epicure;

  EpicureInfState({required this.epicure});

  @override
  String toString() => 'EpicureInfState ${DateTime.now()}';
}

class EpicureListErrorState extends EpicureState {
  final String reason;

  EpicureListErrorState({required this.reason});

  @override
  String toString() => 'EpicureListState ${DateTime.now()}';
}
