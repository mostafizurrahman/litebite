

import 'package:carvice/domain/domain.dart';

class ErrorEntity {
  final LocalizedText serverError;
  final LocalizedText generatedErr;
  final String errorCode;
  final int statusCode;
  final String errorReason;

  ErrorEntity({
    this.serverError = const LocalizedText(
      bangla: 'Network fail',
      english: 'Network fail',
    ),
    this.generatedErr = const LocalizedText(
      bangla: 'Network fail',
      english: 'Network fail',
    ),
    this.errorReason = '',
    this.errorCode = '401',
    this.statusCode = -1,
  });
}