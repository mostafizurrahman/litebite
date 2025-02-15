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
    );

PriceResponse _$PriceResponseFromJson(Map<String, dynamic> json) =>
    PriceResponse(
      full: json['full'] as num? ?? 0,
      half: json['half'] as num? ?? 0,
      oneTo3: json['one_three'] as num? ?? 0,
    );

TimingResponse _$TimingResponseFromJson(Map<String, dynamic> json) =>
    TimingResponse(
      closeTime: json['closeTime'] as String,
      openTime: json['openTime'] as String,
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
      phoneNumber: json['phoneNumber'] as String,
      reviews: (json['review_list'] as List<dynamic>)
          .map((e) => ReviewResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      waiters:
          (json['waiters'] as List<dynamic>).map((e) => e as String).toList(),
      timing: TimingResponse.fromJson(json['timing'] as Map<String, dynamic>),
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
    );

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      orderID: json['order_id'] as String,
      waiters:
          (json['waiters'] as List<dynamic>).map((e) => e as String).toList(),
      orderTime: json['order_time'] as String,
      menuList: (json['menu_list'] as List<dynamic>)
          .map((e) => OrderMenuResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderStatus: json['order_status'] as String,
      tableList: (json['table_list'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      userList:
          (json['user_list'] as List<dynamic>).map((e) => e as String).toList(),
    );

OrderInfoResponse _$OrderInfoResponseFromJson(Map<String, dynamic> json) =>
    OrderInfoResponse(
      orderImage: json['order_image'] as String,
      managerID: json['manager_id'] as String,
      orderList: (json['order_list'] as List<dynamic>)
          .map((e) => OrderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ConnectionResponse _$ConnectionResponseFromJson(Map<String, dynamic> json) =>
    ConnectionResponse(
      state: (json['state'] as num).toInt(),
      userID: json['user_id'] as String,
    );
