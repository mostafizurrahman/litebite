import 'package:carvice/ui/home/restaurant/widgets/restaurant_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './cubit/restaurant_cubit.dart';
import 'package:flutter/material.dart';

import 'cubit/restaurant_state.dart';

class RestaurantHomePage extends StatefulWidget {
  const RestaurantHomePage();

  @override
  State<StatefulWidget> createState() {
    return _RestaurantHomeState();
  }
}

class _RestaurantHomeState extends State<RestaurantHomePage> {
  final _restaurantCubit = RestaurantCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _restaurantCubit.getRestaurantList();
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text('Restaurants'),
          ),
          Expanded(
            child: BlocBuilder(
              bloc: _restaurantCubit,
              builder: _buildRestaurants,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRestaurants(
    final BuildContext ctx,
    final RestaurantState state,
  ) {
    if (state is RestaurantListErrorState) {
      return Container(
        child: Center(
          child: Text('error occurred! ${state.reason}'),
        ),
      );
    }
    if (state is RestaurantListState) {
      return ListView.builder(
          itemCount: state.restaurants.length, itemBuilder: _getRestaurantView);
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getRestaurantView(BuildContext context, int index) {
    final state = _restaurantCubit.state as RestaurantListState;
    final restaurants = state.restaurants;
    return RestaurantView(restaurant: restaurants[index]);
    return ListTile(
        leading: const Icon(Icons.list),
        trailing: const Text(
          "GFG",
          style: TextStyle(color: Colors.green, fontSize: 15),
        ),
        title: Text("List item $index"));
  }
}
