
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity.dart';

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
part 'order_response.dart';

//entity conversions
List<T> _toEntityList<T>(final List<BaseResponse<T>> list) {
  return list.map(_toEntity).toList();
}

T _toEntity<T>(BaseResponse<T> response) {
  return response.toEntity();
}