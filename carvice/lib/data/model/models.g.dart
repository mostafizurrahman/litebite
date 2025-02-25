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

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) => MenuResponse(
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

PriceResponse _$PriceResponseFromJson(Map<String, dynamic> json) =>
    PriceResponse(
      full: json['full'] as num? ?? 0,
      half: json['half'] as num? ?? 0,
      oneTo3: json['one_three'] as num? ?? 0,
    );

TimingResponse _$TimingResponseFromJson(Map<String, dynamic> json) =>
    TimingResponse(
      closeTime: json['close'] as String,
      openTime: json['open'] as String,
    );

WaiterResponse _$WaiterResponseFromJson(Map<String, dynamic> json) =>
    WaiterResponse(
      id: json['id'] as String,
      tables:
          (json['tables'] as List<dynamic>).map((e) => e as String).toList(),
      name: json['name'] as String,
    );

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
    );

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

OrderMenuResponse _$OrderMenuResponseFromJson(Map<String, dynamic> json) =>
    OrderMenuResponse(
      discount: json['discount'] as num? ?? 0,
      quantity: json['quantity'] as num? ?? 1,
      menuPrice: json['unit_price'] as num? ?? 0,
      menuID: json['menu_id'] as String,
      time: const TimestampConverter().fromJson(json['time'] as Timestamp),
      tableID: json['table'] as String,
    );

TableDataResponse _$TableDataResponseFromJson(Map<String, dynamic> json) =>
    TableDataResponse(
      tableID: json['table_id'] as String,
      tableNo: json['table_no'] as num,
      waiterID: json['waiter_id'] as String,
    );

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

OrderInfoResponse _$OrderInfoResponseFromJson(Map<String, dynamic> json) =>
    OrderInfoResponse(
      orderImage: json['order_image'] as String,
      managerID: json['manager_id'] as String,
      orderList: (json['order_list'] as List<dynamic>?)
              ?.map((e) => OrderResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

RestaurantOrderResponse _$RestaurantOrderResponseFromJson(
        Map<String, dynamic> json) =>
    RestaurantOrderResponse(
      isProcessed: json['is_processed'] as bool,
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

ConnectionResponse _$ConnectionResponseFromJson(Map<String, dynamic> json) =>
    ConnectionResponse(
      state: (json['state'] as num).toInt(),
      userID: json['user_id'] as String,
    );

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

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
