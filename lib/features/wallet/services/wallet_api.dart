import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ojos_app/core/constants.dart';
import 'package:ojos_app/core/res/shared_preference_utils/shared_preferences.dart';
import 'package:ojos_app/features/home/domain/model/category_model.dart';
import 'package:ojos_app/features/wallet/model/wallet_model.dart';

Dio dio = Dio();

class WalletPageApi {
  var _cancelToken=CancelToken();
  StreamController? walletController;

  Future<WalletResponse>? fetchWalletData() async {
  var token= await appSharedPrefs.getToken();
  Response response = await dio.get(walletUrl,
    options:Options(headers:{
      "Accept":"application/json",
      "Authorization":"Bearer $token"
    } ) ,
  );
    print(response.toString());
    if (response.statusCode == 200) {
      return WalletResponse.fromJson(response.data);
    } else {
      return WalletResponse.fromJson({});
    }
  }

  // loadProductStream(id) {
  //   feachProduct(id)!.then((res) async {
  //     productController!.add(res);
  //     return res;
  //   });
  // }

  Future<GeneralCategoryModel?>? feachCategory() async {
    Response response = await dio.get(categoryUrl);
    if (response.statusCode == 200) {
      return GeneralCategoryModel.fromJson(response.data);
    }
    return GeneralCategoryModel.fromJson({});
  }
}
