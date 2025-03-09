// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizedResponse _$LocalizedResponseFromJson(Map<String, dynamic> json) =>
    LocalizedResponse(
      en: json['en'] as String?,
      bn: json['bn'] as String?,
    );

Map<String, dynamic> _$LocalizedResponseToJson(LocalizedResponse instance) =>
    <String, dynamic>{
      'en': instance.en,
      'bn': instance.bn,
    };

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) => MenuResponse(
      discountType: json['discount_type'] == null
          ? DiscountType.noDiscount
          : const DiscountConverter().fromJson(json['discount_type'] as String),
      discount: json['discount'] as num? ?? 0,
      coverImage: json['cover_image'] as String? ?? '',
      profileImage: json['profile_image'] as String? ?? '',
      foodImages: (json['food_images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      id: json['id'] as String,
      ownerID: json['owner_id'] as String,
      price: PriceResponse.fromJson(json['price'] as Map<String, dynamic>),
      reviewList: (json['review_list'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      foodType: json['type'] as String? ?? '',
      isPopular: json['popular'] as bool? ?? false,
      description: LocalizedResponse.fromJson(
          json['description'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenuResponseToJson(MenuResponse instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'discount_type': const DiscountConverter().toJson(instance.discountType),
      'cover_image': instance.coverImage,
      'profile_image': instance.profileImage,
      'food_images': instance.foodImages,
      'id': instance.id,
      'owner_id': instance.ownerID,
      'popular': instance.isPopular,
      'price': instance.price,
      'review_list': instance.reviewList,
      'type': instance.foodType,
      'description': instance.description,
    };

PriceResponse _$PriceResponseFromJson(Map<String, dynamic> json) =>
    PriceResponse(
      full: json['full'] as num? ?? 0,
      half: json['half'] as num? ?? 0,
      oneTo3: json['one_three'] as num? ?? 0,
    );

Map<String, dynamic> _$PriceResponseToJson(PriceResponse instance) =>
    <String, dynamic>{
      'full': instance.full,
      'half': instance.half,
      'one_three': instance.oneTo3,
    };

TimingResponse _$TimingResponseFromJson(Map<String, dynamic> json) =>
    TimingResponse(
      closeTime: json['close'] as String,
      openTime: json['open'] as String,
    );

Map<String, dynamic> _$TimingResponseToJson(TimingResponse instance) =>
    <String, dynamic>{
      'open': instance.openTime,
      'close': instance.closeTime,
    };

WaiterResponse _$WaiterResponseFromJson(Map<String, dynamic> json) =>
    WaiterResponse(
      id: json['id'] as String,
      tables:
          (json['tables'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$WaiterResponseToJson(WaiterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tables': instance.tables,
      'name': instance.name,
    };

RestaurantResponse _$RestaurantResponseFromJson(Map<String, dynamic> json) =>
    RestaurantResponse(
      coverImage: json['cover_image'] as String?,
      profileImage: json['profile_image'] as String?,
      description: LocalizedResponse.fromJson(
          json['description'] as Map<String, dynamic>),
      history: json['history'] == null
          ? null
          : LocalizedResponse.fromJson(json['history'] as Map<String, dynamic>),
      menuList: (json['menu'] as List<dynamic>)
          .map((e) => MenuResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: LocalizedResponse.fromJson(json['name'] as Map<String, dynamic>),
      email: json['email'] as String?,
      restaurantID: json['restaurant_id'] as String,
      phoneNumber: json['phone_number'] as String,
      reviews: (json['review_list'] as List<dynamic>)
          .map((e) => ReviewResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      waiters: (json['waiters'] as List<dynamic>)
          .map((e) => WaiterResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      timing: TimingResponse.fromJson(json['timing'] as Map<String, dynamic>),
      orders: (json['order'] as List<dynamic>?)
              ?.map((e) =>
                  RestaurantOrderResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      type: json['type'] as String,
    );

Map<String, dynamic> _$RestaurantResponseToJson(RestaurantResponse instance) =>
    <String, dynamic>{
      'cover_image': instance.coverImage,
      'profile_image': instance.profileImage,
      'description': instance.description,
      'history': instance.history,
      'name': instance.name,
      'menu': instance.menuList,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'restaurant_id': instance.restaurantID,
      'review_list': instance.reviews,
      'waiters': instance.waiters,
      'timing': instance.timing,
      'order': instance.orders,
      'type': instance.type,
    };

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) =>
    ReviewResponse(
      index: json['index'] as num,
      menuID: json['menu_id'] as String,
      profileImage: json['profile_image'] as String,
      rating: json['rating'] as num? ?? -1,
      review: json['review'] as String,
      reviewOrder: json['review_order'] as num,
      reviewType: json['review_type'] as String,
    );

Map<String, dynamic> _$ReviewResponseToJson(ReviewResponse instance) =>
    <String, dynamic>{
      'index': instance.index,
      'menu_id': instance.menuID,
      'profile_image': instance.profileImage,
      'rating': instance.rating,
      'review': instance.review,
      'review_order': instance.reviewOrder,
      'review_type': instance.reviewType,
    };

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      area: json['area'] as String?,
      block: json['block'] as String?,
      city: json['city'] as String?,
      code: json['code'] as String?,
      country: json['country'] as String?,
      district: json['district'] as String?,
      googleMap: json['google'] as String?,
      house: json['house'] as String?,
      road: json['road'] as String?,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'area': instance.area,
      'block': instance.block,
      'city': instance.city,
      'code': instance.code,
      'country': instance.country,
      'district': instance.district,
      'google': instance.googleMap,
      'house': instance.house,
      'road': instance.road,
    };

OrderMenuResponse _$OrderMenuResponseFromJson(Map<String, dynamic> json) =>
    OrderMenuResponse(
      discount: json['discount'] as num? ?? 0,
      quantity: json['quantity'] as num? ?? 1,
      menuPrice: json['unit_price'] as num? ?? 0,
      menuID: json['menu_id'] as String,
      time: const TimestampConverter().fromJson(json['time'] as Timestamp),
      tableID: json['table'] as String,
    );

Map<String, dynamic> _$OrderMenuResponseToJson(OrderMenuResponse instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'quantity': instance.quantity,
      'unit_price': instance.menuPrice,
      'menu_id': instance.menuID,
      'time': const TimestampConverter().toJson(instance.time),
      'table': instance.tableID,
    };

TableDataResponse _$TableDataResponseFromJson(Map<String, dynamic> json) =>
    TableDataResponse(
      tableID: json['table_id'] as String,
      tableNo: json['table_no'] as num,
      waiterID: json['waiter_id'] as String,
    );

Map<String, dynamic> _$TableDataResponseToJson(TableDataResponse instance) =>
    <String, dynamic>{
      'table_id': instance.tableID,
      'waiter_id': instance.waiterID,
      'table_no': instance.tableNo,
    };

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      orderID: json['order_id'] as String,
      waiters:
          (json['waiters'] as List<dynamic>).map((e) => e as String).toList(),
      orderTime:
          const TimestampConverter().fromJson(json['order_time'] as Timestamp),
      menuList: (json['foods'] as List<dynamic>)
          .map((e) => OrderMenuResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderStatus: json['order_status'] as String,
      tableData:
          TableDataResponse.fromJson(json['table'] as Map<String, dynamic>),
      userID: json['user_id'] as String,
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'order_id': instance.orderID,
      'table': instance.tableData,
      'order_status': instance.orderStatus,
      'user_id': instance.userID,
      'foods': instance.menuList,
      'waiters': instance.waiters,
      'order_time': const TimestampConverter().toJson(instance.orderTime),
    };

OrderInfoResponse _$OrderInfoResponseFromJson(Map<String, dynamic> json) =>
    OrderInfoResponse(
      orderImage: json['order_image'] as String,
      managerID: json['manager_id'] as String,
      orderList: (json['order_list'] as List<dynamic>?)
              ?.map((e) => OrderResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$OrderInfoResponseToJson(OrderInfoResponse instance) =>
    <String, dynamic>{
      'order_image': instance.orderImage,
      'manager_id': instance.managerID,
      'order_list': instance.orderList,
    };

RestaurantOrderResponse _$RestaurantOrderResponseFromJson(
        Map<String, dynamic> json) =>
    RestaurantOrderResponse(
      orderStatus:
          const OrderStatusConverter().fromJson(json['order_status'] as String),
      menus: (json['menus'] as List<dynamic>).map((e) => e as String).toList(),
      orderID: json['order_id'] as String,
      orderTime:
          const TimestampConverter().fromJson(json['order_time'] as Timestamp),
      tables:
          (json['tables'] as List<dynamic>).map((e) => e as String).toList(),
      waiters:
          (json['waiters'] as List<dynamic>).map((e) => e as String).toList(),
      customerNumber: json['customer_contact'] as String,
      restaurantNumber: json['restaurant_contact'] as String,
      userID: json['user_id'] as String,
    );

Map<String, dynamic> _$RestaurantOrderResponseToJson(
        RestaurantOrderResponse instance) =>
    <String, dynamic>{
      'order_status': const OrderStatusConverter().toJson(instance.orderStatus),
      'menus': instance.menus,
      'order_id': instance.orderID,
      'order_time': const TimestampConverter().toJson(instance.orderTime),
      'tables': instance.tables,
      'waiters': instance.waiters,
      'customer_contact': instance.customerNumber,
      'user_id': instance.userID,
      'restaurant_contact': instance.restaurantNumber,
    };

ConnectionResponse _$ConnectionResponseFromJson(Map<String, dynamic> json) =>
    ConnectionResponse(
      state: (json['state'] as num).toInt(),
      userID: json['user_id'] as String,
    );

Map<String, dynamic> _$ConnectionResponseToJson(ConnectionResponse instance) =>
    <String, dynamic>{
      'state': instance.state,
      'user_id': instance.userID,
    };

EpicureResponse _$EpicureResponseFromJson(Map<String, dynamic> json) =>
    EpicureResponse(
      connections: (json['connections'] as List<dynamic>)
          .map((e) => ConnectionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverImage: json['cover_image'] as String? ?? '',
      profileImage: json['profile_image'] as String? ?? '',
      dateSubscribed: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['date_subscription'], const TimestampConverter().fromJson),
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      name: json['name'] as String,
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => OrderResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      loginType: json['login_type'] as String? ?? 'email',
      premium: json['premium'] as bool? ?? false,
      profession: json['profession'] as String,
      userID: json['user_id'] as String,
    );

Map<String, dynamic> _$EpicureResponseToJson(EpicureResponse instance) =>
    <String, dynamic>{
      'connections': instance.connections,
      'cover_image': instance.coverImage,
      'profile_image': instance.profileImage,
      'date_subscription': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.dateSubscribed, const TimestampConverter().toJson),
      'email': instance.email,
      'mobile': instance.mobile,
      'name': instance.name,
      'orders': instance.orders,
      'login_type': instance.loginType,
      'premium': instance.premium,
      'profession': instance.profession,
      'user_id': instance.userID,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
