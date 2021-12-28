// orders_attributes
// OrderAttributeModel

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:ojos_app/core/appConfig.dart';
import 'package:ojos_app/core/constants.dart';
import 'package:ojos_app/features/order/data/models/custom_order.dart';
import 'package:ojos_app/features/user_management/domain/repositories/user_repository.dart';

Dio dio = Dio();

Future<OrderAttributeModel>? feachOrderAttribute() async {
  Response response = await dio.get(orders_attributes);
  if (response.statusCode == 200) {
    print(response.data);
    return OrderAttributeModel.fromJson(response.data);
  } else {
    return OrderAttributeModel.fromJson({});
  }
}

Future storeOrder(context,
    {required String order_date,
    required String name,
    required String phone,
    required String address,
    required int count_item,
    required int length,
    // required int waist,
    required int chest,
    required int shoulder,
    required int hand,
    required int neck,
    required int armpit,
    required int elbow,
    required int gypsour,
    required int step,
    required int pocket_type,
    required int type_hand,
    required int tailor_id,
    required int model_id,
    required int pocket_id,
    required int acctype_id,
    // required int fabric_id,
    // required int accnum_id,
    // required int addition_id,
    //  required int embroidery_id,  ******* تطريز سليم   *******************
    required int collar_id,
    required String visiting,
    required String note,
    required int gypsourtype,
    required int fillingtype}) async {
  final Map<String, dynamic> headers = {};

  // Get the language.
  final lang = await appConfig.currentLanguage;
  CancelToken _cancelToken = CancelToken();

  if (UserRepository.hasToken) {
    final token = await UserRepository.authToken;
    headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
    headers.putIfAbsent(HEADER_LANGUAGE, () => lang);
    headers.putIfAbsent(HEADER_CONTENT_TYPE, () => 'application/json');
    headers.putIfAbsent(HEADER_ACCEPT, () => 'application/json');

    var da = {
      "name": name,
      "phone": phone,
      "address": address,
      "order_date": order_date,
      "visiting": visiting,
      "count_item": count_item,
      "length": length,
      // "waist": waist,
      "chest": chest,
      "shoulder": shoulder,
      "hand": hand,
      "neck": neck,
      "armpit": armpit,
      "elbow": elbow,
      "gypsour": gypsour,
      "step": step,
      "pocket_type": pocket_type,
      "type_hand": type_hand,
      "tailor_id": tailor_id,
      //"model_id": model_id,
      "pocket_id": pocket_id,
      "acctype_id": acctype_id,
      // "fabric_id": fabric_id,
      // "accnum_id": accnum_id,
      // "addition_id": addition_id,
      //  "embroidery_id": embroidery_id,   *********** تطريز سليم  **********
      "collar_id": collar_id,
      "gypsour_id": gypsourtype,
      "filling_type_id": fillingtype,
      "note": " لا يوجد"
    };
    print(da);

    await Dio()
        .post(orders_post_orderOnlines,
            data: {
              // "name": "my anme",
              // "phone": "05545345345",
              // "address": "addres",
              // "order_date": "2021-11-01",
              // "visiting": "fsdfsd",
              // "count_item": 1,
              // "length": 23,
              // "waist": 23,
              // "chest": 23,
              // "shoulder": 23,
              // "hand": 23,
              // "neck": 23,
              // "armpit": 23,
              // "elbow": 23,
              // "gypsour": 1,
              // "step": 23,
              // "pocket_type": 277,
              // "type_hand": 280,
              // "tailor_id": 69,
              // "model_id": 78,
              // "pocket_id": 109,
              // "acctype_id": 209,
              // "fabric_id": 259,
              // "accnum_id": 263,
              // "addition_id": 265,
              // "collar_id": 270,
              // "gypsour_id": 297,
              // "filling_type_id": 300,
              // "note": " لا يوجد"
              "name": name,
              "phone": phone,
              "address": address,
              "order_date": order_date,
              "visiting": visiting,
              "count_item": count_item,
              "length": length,
              // "waist": waist,
              "chest": chest,
              "shoulder": shoulder,
              "hand": hand,
              "neck": neck,
              "armpit": armpit,
              "elbow": elbow,
              "gypsour": gypsour,
              "step": step,
              "pocket_type": pocket_type,
              "type_hand": type_hand,
              "tailor_id": tailor_id,
              // "model_id": model_id,
              "pocket_id": pocket_id,
              "acctype_id": acctype_id,
              // "fabric_id": fabric_id,
              // "accnum_id": accnum_id,
              // "addition_id": addition_id,
              //"embroidery_id": embroidery_id, *********** تطريز سليم  **********
              "collar_id": collar_id,
              "gypsour_id": gypsourtype,
              "filling_type_id": fillingtype,
              "note": note
            },
            cancelToken: _cancelToken,
            options: Options(headers: {'Authorization': 'Bearer $token'}))
        .then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "تم الطلب بنجاح",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(value);
    }).catchError((e) {
      Fluttertoast.showToast(
          msg: "يرجي المحاولة في وقت اخر",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print("error is *************************** $e");
    }).onError((error, stackTrace) {
      print("error is *************************** $error");
    });

    // print(response.data);
    // print(response.statusMessage);
  }
  //headers.putIfAbsent(HEADER_AUTH, () => 'Bearer $token');
  headers.putIfAbsent(HEADER_LANGUAGE, () => lang);
  headers.putIfAbsent(HEADER_CONTENT_TYPE, () => 'application/json');
  headers.putIfAbsent(HEADER_ACCEPT, () => 'application/json');
  // if (withAuthentication) {

  print(headers);
}
