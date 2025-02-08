
import 'package:carvice/data/firebase/firebase_reader.dart';
import 'package:carvice/data/model/models.dart';

import 'data_storage.dart';

class RestaurantDataSource {
  final _storage = DataStorage.shared;
  final int limit;
  RestaurantDataSource({this.limit = 15});

  Future<List<RestaurantResponse>> getRestaurantListResponse() async {
    final reader = FirebaseReader();
    final documents = await reader.getRestaurantList(
      limit: limit,
      lastSnap: _storage.lastDocument,
    );
    return _storage.updateStorage(documents: documents);
  }
}
