import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_constants.dart';

class FirebaseReader {
  final _db = FirebaseFirestore.instance;

  FirebaseReader() {
    _db.settings = Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  Future<List<DocumentSnapshot>> getRestaurantList({
    required final int limit,
    required DocumentSnapshot? lastSnap,
  }) async {
    final cursor = [lastSnap?.get(FBConstants.fieldIndex)];
    final query = _db
        .collection(FBConstants.dbRestaurant)
        .orderBy(FBConstants.fieldIndex, descending: true)
        .startAfter(cursor) // Start after the last document
        .limit(limit);

    QuerySnapshot snapshot = await query.get(GetOptions(source: Source.cache));
    if (snapshot.docs.isEmpty) {
      snapshot = await query.get(GetOptions(source: Source.server));
    }
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs;
    }
    return [];
  }
}
