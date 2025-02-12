


import 'package:carvice/domain/domain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

mixin ErrorRepositoryMixin {
  ErrorEntity getBaseError(final exception) {
    if (exception is FirebaseException) {
      final errorEntity = ErrorEntity(
        errorCode: exception.code,
        errorReason: exception.message ?? 'Document not exists',
        generatedErr: LocalizedText(
          bangla: exception.message ?? 'নেটওয়ার্ক ভুল হয়েছে!',
          english: 'Error occurred!',
        ),
      );
      return errorEntity;
    }
    return ErrorEntity(errorReason: exception.toString(), errorCode: '400');
  }
}