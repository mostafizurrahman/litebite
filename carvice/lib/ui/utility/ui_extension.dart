

import 'package:flutter/foundation.dart';
import 'package:carvice/domain/domain.dart';


extension MenuMap on Map<Object,Object> ?{
  bool get hasValue => this?.isNotEmpty ?? false;
}