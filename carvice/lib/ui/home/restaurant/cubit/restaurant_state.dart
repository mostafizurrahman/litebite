


import 'package:carvice/domain/domain.dart';

abstract class RestaurantState {
  final List<Object> properties = [];
  @override
  String toString() => 'RestaurantState ${DateTime.now()}';


}


class RestaurantInitState extends RestaurantState {

}

class RestaurantListState extends RestaurantState{
  final List<Restaurant> restaurants;
  RestaurantListState({required this.restaurants});
  @override
  String toString() => 'RestaurantListState ${DateTime.now()}';
}


class RestaurantListErrorState extends RestaurantState{
  final String reason;
  RestaurantListErrorState({required this.reason});
  @override
  String toString() => 'RestaurantListState ${DateTime.now()}';
}