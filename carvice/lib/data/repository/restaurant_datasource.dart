
import 'package:carvice/data/firebase/firebase_reader.dart';
import 'package:carvice/data/model/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_storage.dart';

class RestaurantDataSource {
  final _reader = FirebaseReader();
  final _storage = DataStorage.shared;
  final int limit;
  RestaurantDataSource({this.limit = 15});

  Future<List<RestaurantResponse>> getRestaurantListResponse() async {
    if (_storage.pullingEnd) {
      return _storage.updateStorage(documents: []);
    }

    final documents = await _reader.getRestaurantList(
      limit: limit,
      lastSnap: _storage.lastDocument,
    );
    return _storage.updateStorage(documents: documents);
  }

  EpicureResponse _toEpicureResponse(final DocumentSnapshot snap) {
    final json = snap.data() as Map<String, dynamic>;
    final response = EpicureResponse.fromJson(json);
    return response;
  }


  Future<EpicureResponse?> getUserBy({required final String userID}) async {
    final user = _storage.getUser(userID:userID);
    if (user == null) {
      final snap = await _reader.getUserBy(userID: userID);
      if (snap != null) {
        final data = _toEpicureResponse(snap);
        return data;
      }
    }
    return user;
  }

}
