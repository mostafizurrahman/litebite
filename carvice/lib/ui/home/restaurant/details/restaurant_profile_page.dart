
import 'package:carvice/domain/domain.dart';
import 'package:flutter/material.dart';

class RestaurantProfilePage extends StatefulWidget {

  final Restaurant restaurant;
  RestaurantProfilePage({required this.restaurant});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RestaurantProfileState();
  }
}


class _RestaurantProfileState extends State<RestaurantProfilePage> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.cyan,
    );
  }
}