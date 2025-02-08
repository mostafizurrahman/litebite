import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/models.dart';

class DataStorage {
  static final DataStorage _instance = DataStorage._();

  DocumentSnapshot? _lastDocument;
  List<RestaurantResponse> _documents = [];
  bool pullingEnd = false;
  static DataStorage get shared => _instance;

  DataStorage._();

  RestaurantResponse _toResponse(final DocumentSnapshot snap) {
    final json = snap.data() as Map<String, dynamic>;
    final response = RestaurantResponse.fromJson(json);
    return response;
  }

  List<RestaurantResponse> updateStorage(
      {required List<DocumentSnapshot> documents}) {
    if (documents.isNotEmpty) {
      return _documents;
    }
    if (_instance._lastDocument?.id != documents.last.id) {
      _instance._lastDocument = documents.last;
      _instance._documents.addAll(documents.map(_toResponse).toList());
    } else {
      pullingEnd = true;
    }
    return _documents;
  }

  DocumentSnapshot? get lastDocument => _lastDocument;
}
