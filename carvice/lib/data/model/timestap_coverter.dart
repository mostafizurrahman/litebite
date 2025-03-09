import 'package:carvice/domain/entity/restaurant_order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

// Custom converter for Firestore Timestamp
class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

// Custom converter for Firestore Timestamp
class OrderStatusConverter
    implements JsonConverter<OrderProcessStatus, String> {
  const OrderStatusConverter();

  @override
  OrderProcessStatus fromJson(String strStatus) {
    final values = OrderProcessStatus.values;
    return values.firstWhere(
      (status) => status.toString().toLowerCase().contains(
            strStatus.toLowerCase(),
          ),
    );
  }

  @override
  String toJson(OrderProcessStatus statusEnum) => statusEnum.value;
}
