
import 'package:carvice/domain/entity/restaurant_order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/domain.dart';
import 'timestap_coverter.dart';

// add the single generated code file produced by json_serializer
// applied to all the modules
part 'models.g.dart';
part 'base_response.dart';
part 'localized_response.dart';
part 'menu_response.dart';
part 'price_response.dart';
part 'restaurant_response.dart';
part 'review_response.dart';
part 'location_response.dart';
part 'table_response.dart';
part 'orders/restaurant_order.dart';
// part 'orders/restaurant_order.dart';
// part 'orders/restaurant_order.dart';
// part 'orders/restaurant_order.dart';
// part 'orders/restaurant_order.dart';
part 'epicure_response.dart';

//entity conversions
List<T> _toEntityList<T>(final List<BaseResponse<T>> list) {
  return list.map(_toEntity).toList();
}

T _toEntity<T>(BaseResponse<T> response) {
  return response.toEntity();
}

DateTime parseDateTime(final String? dateString) {
  String formattedDate = dateString?.replaceAll("at", "").trim() ?? '';

  // Define date format pattern
  DateFormat format = DateFormat("MMMM d, yyyy hh:mm:ss a 'UTC'XXX");

  // Parse the date
  DateTime parsedDate = format.parse(formattedDate);
  return parsedDate;
}