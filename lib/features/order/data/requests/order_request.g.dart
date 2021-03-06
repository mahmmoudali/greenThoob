// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) {
  return OrderRequest(
      order_date: json['order_date'],
      region: json['region'],
      street: json['street'],
      flat: json['flat'],
      name: json['name'],
      phone: json['phone'],
      address: json['address'],
      tax: json['tax'] as int,
      discount: json['discount'],
      total: json['total'] as int,
      coupon_id: json['coupon_id'] as int,
      note: json['note'] as String,
      cartItems: (json['cartItems'] as List) == null
          ? null
          : json['cartItems' as List].map((e) {
              ProductOrderRequest.fromJson(e as Map<String, dynamic>);
            }).toList(),
      method_id: json['method_id'] ?? 8,
      subtotal: json['subtotal'],
      delivery_fee: json['delivery_fee']);
}

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      //'order_date': instance.order_date,
      'region': instance.region,
      'flat': instance.flat,
      'street': instance.street,
      'discount': instance.discount,
      'tax': instance.tax,
      'total': instance.total,
      'note': instance.note,
      'coupon_id': instance.coupon_id,
      'delivery_fee': instance.delivery_fee,
      'subtotal': instance.subtotal,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      "delivery_fee": 12,
      'cartItems': instance.cartItems,
      'method_id': 2,
    };

ProductOrderRequest _$ProductOrderRequestFromJson(Map<String, dynamic> json) {
  return ProductOrderRequest(
    price: (json['price'] as num).toDouble(),
    type_product: json['type_product'] as int,
    product_id: json['product_id'] as int,
    //   lens_size: json['lens_size'] as String,
    quantity: json['quantity'] as int,
//    sizeMode: json['sizeMode'] as int,
    brand_id: json['brand_id'] as int,
    //   color_id: json['color_id'] as int,
    Is_Glasses: json['Is_Glasses'] as int,
    //   lens_left_size: json['lens_left_size'] as String,
    //   lens_right_size: json['lens_right_size'] as String,
  );
}

Map<String, dynamic> _$ProductOrderRequestToJson(
        ProductOrderRequest instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'type_product': instance.type_product,
      'Is_Glasses': instance.Is_Glasses,
      //  'color_id': instance.color_id,
      'brand_id': instance.brand_id,
      //'sizeMode': instance.sizeMode,
      'quantity': instance.quantity,
      'price': instance.price,
      //  'lens_size': instance.lens_size,
      //  'lens_right_size': instance.lens_right_size,
      //  'lens_left_size': instance.lens_left_size,
    };

DeliveryOrderRequest _$DeliveryOrderRequestFromJson(Map<String, dynamic> json) {
  return DeliveryOrderRequest(
    delivery_address: json['delivery_address'] as String,
    delivery_city: json['delivery_city'] as String,
    delivery_phone: json['delivery_phone'] as String,
    delivery_state: json['delivery_state'] as String,
    delivery_zipcode: json['delivery_zipcode'] as String,
    delivery_email: json['delivery_email'] as String,
    delivery_mobile_1: json['delivery_mobile_1'] as String,
    delivery_mobile_2: json['delivery_mobile_2'] as String,
    delivery_name: json['delivery_name'] as String,
  );
}

Map<String, dynamic> _$DeliveryOrderRequestToJson(
        DeliveryOrderRequest instance) =>
    <String, dynamic>{
      'delivery_name': instance.delivery_name,
      'delivery_mobile_1': instance.delivery_mobile_1,
      'delivery_mobile_2': instance.delivery_mobile_2,
      'delivery_email': instance.delivery_email,
      'delivery_address': instance.delivery_address,
      'delivery_city': instance.delivery_city,
      'delivery_state': instance.delivery_state,
      'delivery_zipcode': instance.delivery_zipcode,
      'delivery_phone': instance.delivery_phone,
    };

CardOrderRequest _$CardOrderRequestFromJson(Map<String, dynamic> json) {
  return CardOrderRequest(
    number: json['number'] as String,
    cvc: json['cvc'] as String,
    exp_month: json['exp_month'] as String,
    exp_year: json['exp_year'] as String,
  );
}

Map<String, dynamic> _$CardOrderRequestToJson(CardOrderRequest instance) =>
    <String, dynamic>{
      'number': instance.number,
      'exp_month': instance.exp_month,
      'exp_year': instance.exp_year,
      'cvc': instance.cvc,
    };
