
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/localized_text.dart';

// add the single generated code file produced by json_serializer
// applied to all the modules
part 'models.g.dart';
part 'base_response.dart';
part 'localized_response.dart';


//entity conversions
List<T> _toEntityList<T>(final List<BaseResponse<T>> list) {
  return list.map(_toEntity).toList();
}

T _toEntity<T>(BaseResponse<T> response) {
  return response.toEntity();
}