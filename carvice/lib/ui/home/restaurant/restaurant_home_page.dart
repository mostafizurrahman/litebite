import 'package:flutter_bloc/flutter_bloc.dart';

import './cubit/restaurant_cubit.dart';
import 'package:flutter/material.dart';

import 'cubit/restaurant_state.dart';
import 'widgets/food_filter_view.dart';
import 'widgets/restaurant_home_view.dart';
import 'widgets/restaurant_view.dart';

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
    _restaurantCubit.getRestaurantList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [

          FoodFilterView(),
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
        itemCount: state.restaurants.length,
        itemBuilder: _getRestaurantView,
      );
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getRestaurantView(BuildContext context, int index) {
    final state = _restaurantCubit.state as RestaurantListState;
    final restaurants = state.restaurants;
    return RestaurantHomeView(restaurant: restaurants[index]);

  }
}
