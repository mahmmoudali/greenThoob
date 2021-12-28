import 'package:flutter/foundation.dart';
import 'package:ojos_app/core/entities/base_entity.dart';
import 'package:ojos_app/features/product/domin/entities/item_entity.dart';

import 'city_order_entity.dart';
import 'order_item_entity.dart';
import 'user_address_entity.dart';

class GeneralOrderItemEntity extends BaseEntity {
  final int id;
  final String uid;

  // final String order_number;
  final int user_id;
  final String address;
  final String order_date;

  // final int coupon_id;
  // final int shipping_id;
  // final int shipping_fee;
  final String note;
  final String name;
  final String phone;

  // final int price_discount;
  // final double orginal_price;
  final int tax;
  int? discount;
  int? subtotal;
  final int total;

  // final String delivery_address;
  // final String delivery_city;
  // final String delivery_state;
  // final String delivery_zipcode;
  // final String delivery_phone;
  // final String billing_name;
  // final String point_map;
  // final String status;
  // final String statusint;
  final String paymentmehtod;
  final String orderimage;
  int? delivery_fee;
  final String status;

  // final ItemEntity shippingcarrier;
  // final UserAddressEntity user_address;
  // final CityOrderEntity city;
  final List<OrderItemEntity> order_items;

  GeneralOrderItemEntity({
    required this.order_date,
    required this.id,
    required this.address,
    required this.user_id,
    required this.total,
    required this.discount,
    required this.status,
    required this.subtotal,
    required this.name,
    required this.phone,
    // required this.status,
    // required this.billing_name,
    //required this.coupon_id,
    // required this.delivery_address,
    // required this.delivery_city,
    // required this.delivery_phone,
    // required this.delivery_state,
    // required this.delivery_zipcode,
    required this.note,
    required this.delivery_fee,
    required this.order_items,
    required this.paymentmehtod,

    //required this.point_map,
    required this.orderimage,
    //required this.statusint,
    //required this.price_discount,
    // required this.shipping_fee,
    // required this.shipping_id,
    required this.tax,
    required this.uid,
  });

  @override
  List<Object> get props => [
        id,
        user_id,
        total,
        discount ?? 0,
        // status,
        // billing_name,
        //coupon_id,
        // delivery_address,
        // delivery_city,
        paymentmehtod,
        //statusint,
        orderimage,
        // delivery_phone,
        // delivery_state,
        // delivery_zipcode,
        note,
        order_items,
        // order_number,
        //  point_map,
        //price_discount,
        // shipping_fee,
        // shipping_id,
        tax,
        uid,
      ];
}
