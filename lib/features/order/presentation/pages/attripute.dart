import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' as Get;
import 'package:ojos_app/core/localization/translations.dart';
import 'package:ojos_app/core/res/edge_margin.dart';
import 'package:ojos_app/core/res/global_color.dart';
import 'package:ojos_app/core/res/screen/horizontal_padding.dart';
import 'package:ojos_app/core/res/screen/vertical_padding.dart';
import 'package:ojos_app/core/res/shared_preference_utils/shared_preferences.dart';
import 'package:ojos_app/core/res/text_style.dart';
import 'package:ojos_app/features/home/domain/model/product_model.dart';
import 'package:ojos_app/features/home/domain/services/home_api.dart';
import 'package:ojos_app/features/home/presentation/widget/item_offer_widget.dart';
import 'package:ojos_app/features/order/data/api_responses/feach_attripute.dart';
import 'package:ojos_app/features/order/data/models/custom_order.dart';
import 'package:ojos_app/features/order/presentation/pages/confirm_attripute.dart';
import 'package:ojos_app/features/user_management/domain/repositories/user_repository.dart';
import 'package:ojos_app/features/user_management/presentation/pages/sign_in_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';


class OrderAttribute extends StatefulWidget {
  @override
  _OrderAttributeState createState() => _OrderAttributeState();
}

class _OrderAttributeState extends State<OrderAttribute> {
  // int _radioValue;
  List<Add> adds = [];

  @override
  void initState() {
    hastol();
    homePageApi.feachProduct(1)!.then((value) {
      adds = value.result.adds;
    });
    super.initState();
  }

  List<bool> selectsTailors = [false, false, false, false, false];

  Future<bool> hastol() async {
    return await UserRepository.hasToken;
  }

  /// عدد الثياب
  TextEditingController thawbNumber = TextEditingController();
  int tailorslistValue = 0;

  /// نوع الثوب

  /// الطول
  TextEditingController length = TextEditingController();

  /// الرقبة
  TextEditingController neck = TextEditingController();

  /// طول اليد
  TextEditingController handLength = TextEditingController();

  /// الكتف
  TextEditingController shoulder = TextEditingController();

  /// الصدر
  TextEditingController chest = TextEditingController();

  ///الكوع
  TextEditingController elbow = TextEditingController();

  ///الباط
  TextEditingController bat = TextEditingController();

  ///اسفل
  TextEditingController Belowbat = TextEditingController();

  ///الخطوة
  TextEditingController step = TextEditingController();

  ///مقاس جيزور
  TextEditingController jisor = TextEditingController();
  // TextEditingController waist = TextEditingController();

  PageController controller =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  /// tailorslistValue

  // List<String> dimensions = ['D1', 'D2', 'D3'];
  // List<bool> selects = [false, false, false];
  int modelslistValue = 0;
  int pocketslistValue = 0;
  int accdresslistValue = 0;
  int acctypeslistValue = 0;
  int fabricslistValue = 0;
  int accnumlistValue = 0;
  int additionslistValue = 0;
  int collarlistValue = 0;
  int pockettypelistValue = 0;
  int typehandlistValue = 0;
  int fillingtypeList = 0;
  int gypsourValue = 0;
  int embroiderylistValue = 0;       //********************************تطريز***********************************************

/*  List<Add> adds =;*/
  final globalKey = GlobalKey<FormState>();

  HomePageApi homePageApi = HomePageApi();

  @override
  Widget build(BuildContext context) {
    return UserRepository.hasToken
        ? Scaffold(
            // appBar: AppBar(
            //   title: Text(
            //     "طلب اون لاين",
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            body: adds == []
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  )
                : SafeArea(
                    child: FutureBuilder(
                        future: feachOrderAttribute(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            OrderAttributeModel? attribut =
                                snapshot.data as OrderAttributeModel;
                            return Form(
                              key: globalKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          _buildTopAds(
                                              context: context,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 150.h),
                                          // Padding(
                                          //   padding: const EdgeInsets.all(8.0),
                                          //   child: Text(
                                          //     "نوع التفصيل",
                                          //     style: textStyle.middleTSBasic
                                          //         .copyWith(
                                          //             color: globalColor
                                          //                 .primaryColor,
                                          //             fontWeight:
                                          //                 FontWeight.bold),
                                          //     textAlign: TextAlign.start,
                                          //   ),
                                          // ),
                                          Container(
                                            height: 140,
                                            child: Row(
                                              children: [
                                                customTextField(
                                                    "عدد الثياب", thawbNumber),
                                                Expanded(
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            tailorslistValue =
                                                                attribut
                                                                    .result!
                                                                    .tailorslist![
                                                                        index]
                                                                    .id!;
                                                            for (int i = 0;
                                                                i <
                                                                    selectsTailors
                                                                        .length;
                                                                i++) {
                                                              if (i == index) {
                                                                selectsTailors[
                                                                        index] =
                                                                    !selectsTailors[
                                                                        index];
                                                              } else {
                                                                selectsTailors[
                                                                    i] = false;
                                                              }
                                                            }
                                                          });
                                                        },
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: globalColor
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                border:
                                                                    Border.all(
                                                                  color: selectsTailors[
                                                                              index] ==
                                                                          true
                                                                      ? globalColor
                                                                          .primaryColor
                                                                      : globalColor
                                                                          .grey
                                                                          .withOpacity(
                                                                              0.2),
                                                                  ////            <--- border color
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 8,
                                                                    horizontal:
                                                                        0),
                                                                child: Text(
                                                                  attribut
                                                                      .result!
                                                                      .tailorslist![
                                                                          index]
                                                                      .name!,
                                                                  style: textStyle
                                                                      .smallTSBasic
                                                                      .copyWith(
                                                                          color:
                                                                              globalColor.grey),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    itemCount: attribut.result!
                                                        .tailorslist!.length,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "الالوان",
                                                  style: textStyle.middleTSBasic
                                                      .copyWith(

                                                      color: Colors.black,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5.h,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                color: Colors.black,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                color: Colors.grey,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                color: Colors.brown,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                color: Colors.black12,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                color: Colors.orangeAccent,
                                              ),

                                            ],
                                          ),
                                          SizedBox(height: 8.h,),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(

                                              children: [
                                                Text(
                                                  "المقاسات",
                                                  style: textStyle.middleTSBasic
                                                      .copyWith(

                                                      color: Colors.black,

                                                      fontWeight:
                                                      FontWeight.bold),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                          ),
                                          // SizedBox(height: 5.h,),
                                          Container(
                                            alignment: AlignmentDirectional.topStart,
                                            width: 200.w,
                                            child: dropdownWidget(),
                                          ),
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          //   children: [
                                          //     Container(
                                          //       height: 40,
                                          //       width: 40,
                                          //       child: Text(
                                          //         'M',
                                          //         style: TextStyle(
                                          //           color: Colors.black,
                                          //           fontSize: 20,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     Container(
                                          //       height: 40,
                                          //       width: 40,
                                          //       child: Text(
                                          //         'L',
                                          //         style: TextStyle(
                                          //           color: Colors.black,
                                          //           fontSize: 20,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     Container(
                                          //       height: 40,
                                          //       width: 40,
                                          //       child: Text(
                                          //         'XL',
                                          //         style: TextStyle(
                                          //           color: Colors.black,
                                          //           fontSize: 20,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     Container(
                                          //       height: 40,
                                          //       width: 40,
                                          //       child: Text(
                                          //         'XXL',
                                          //         style: TextStyle(
                                          //           color: Colors.black,
                                          //           fontSize: 20,
                                          //           fontWeight: FontWeight.bold,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          SizedBox(height: 8.h,),

                                          // Padding(
                                          //   padding: const EdgeInsets.all(8.0),
                                          //   child: Text(
                                          //     "المقاس تفصيلا",
                                          //     style: textStyle.middleTSBasic
                                          //         .copyWith(
                                          //             color: Colors.black,
                                          //             fontWeight:
                                          //                 FontWeight.bold),
                                          //     textAlign: TextAlign.start,
                                          //   ),
                                          // ),
                                          Wrap(
                                            children: [
                                              customTextField("الطول", length),
                                              customTextField("الرقبة", neck),
                                              customTextField(
                                                  "طول اليد", handLength),
                                              customTextField(
                                                  "الكتف", shoulder),
                                              customTextField("الخصر", chest),
                                              customTextField("الكوع", elbow),
                                              customTextField("الباط", bat),
                                              customTextField(
                                                  "اسفل الباط", Belowbat),
                                              customTextField("الخطوة", step),
                                              customTextField(
                                                  "مقاس جبزور", jisor),
                                              // customTextField("الوسط", waist),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "نوع اللياقة",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  collarlistValue = attribut
                                                      .result!
                                                      .collarlist![index]
                                                      .id!;
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      customTextWithColor(
                                                          attribut
                                                                  .result!
                                                                  .collarlist![
                                                                      index]
                                                                  .name ??
                                                              ""),
                                                      Radio(
                                                        value: attribut
                                                            .result!
                                                            .collarlist![index]
                                                            .id!,
                                                        groupValue:
                                                            collarlistValue,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            collarlistValue =
                                                                value! as int;
                                                          });
                                                          print("aaaaaaaaaaaaaaaaaa" +
                                                              value.toString());
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              itemCount: attribut
                                                  .result!.collarlist!.length,
                                            ),
                                          ),
                                          /*Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "اضافات",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                      color: globalColor
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  additionslistValue = attribut
                                                      .result!
                                                      .additionslist![index]
                                                      .id!;
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      customTextWithColor(attribut
                                                              .result!
                                                              .additionslist![
                                                                  index]
                                                              .name ??
                                                          ""),
                                                      Radio(
                                                        value: attribut
                                                            .result!
                                                            .additionslist![
                                                                index]
                                                            .id!,
                                                        groupValue:
                                                            additionslistValue,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            additionslistValue =
                                                                value! as int;
                                                          });
                                                          print("aaaaaaaaaaaaaaaaaa" +
                                                              value.toString());
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              itemCount: attribut.result!
                                                  .additionslist!.length,
                                            ),
                                          ),*/
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "التطريز",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                  color: Colors.black,
                                                  fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      customTextWithColor("تطريز"),
                                                      Radio(
                                                        value: attribut
                                                            .result!
                                                            .fillingtype![index]
                                                            .id!,
                                                        groupValue:
                                                        fillingtypeList,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            fillingtypeList =
                                                            value! as int;
                                                          });
                                                          print("aaaaaaaaaaaaaaaaaa" +
                                                              value.toString());
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                  ),
                                              itemCount: attribut.result!
                                                  .fillingtype!.length,
                                            ),
                                          ),
/*                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "التطريز",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                      color: globalColor
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  embroiderylistValue = attribut
                                                      .result!
                                                      .embroiderylist![index]
                                                      .id!;
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      customTextWithColor(attribut
                                                              .result!
                                                              .embroiderylist![
                                                                  index]
                                                              .name ??
                                                          ""),
                                                      Radio(
                                                        value: attribut
                                                            .result!
                                                            .embroiderylist![
                                                                index]
                                                            .id!,
                                                        groupValue:
                                                          embroiderylistValue,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            embroiderylistValue =
                                                                value! as int;
                                                          });
                                                          print("aaaaaaaaaaaaaaaaaa" +
                                                              value.toString());
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              itemCount: attribut.result!
                                                  .embroiderylist!.length,
                                            ),
                                          ),*/
                                          //  ssssssssssssssssslllllllll
                                          /*Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "نوع الحشوة",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                      color: globalColor
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  fillingtypeList = attribut
                                                      .result!
                                                      .fillingtype![index]
                                                      .id!;
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      customTextWithColor(
                                                          attribut
                                                                  .result!
                                                                  .fillingtype![
                                                                      index]
                                                                  .name ??
                                                              ""),
                                                      Radio(
                                                        value: attribut
                                                            .result!
                                                            .fillingtype![index]
                                                            .id!,
                                                        groupValue:
                                                            fillingtypeList,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            fillingtypeList =
                                                                value! as int;
                                                          });
                                                          print("aaaaaaaaaaaaaaaaaa" +
                                                              value.toString());
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              itemCount: attribut
                                                  .result!.fillingtype!.length,
                                            ),
                                          ),*/
                                          /////////////////////////////////////////////////////////////////////////////////////////
                                          /*Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "مقاسات جبزورة",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                      color: globalColor
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  gypsourValue = attribut
                                                      .result!
                                                      .gypsourlist![index]
                                                      .id!;
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      customTextWithColor(
                                                          attribut
                                                                  .result!
                                                                  .gypsourlist![
                                                                      index]
                                                                  .name ??
                                                              ""),
                                                      Radio(
                                                        value: attribut
                                                            .result!
                                                            .gypsourlist![index]
                                                            .id!,
                                                        groupValue:
                                                            gypsourValue,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            gypsourValue =
                                                                value! as int;
                                                          });
                                                          print("aaaaaaaaaaaaaaaaaa" +
                                                              value.toString());
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              itemCount: attribut
                                                  .result!.gypsourlist!.length,
                                            ),
                                          ),*/
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "الجيوب",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                  color: Colors.black,
                                                  fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: Row(
                                              children: [
                                                // customTextField(
                                                //     "جيب البنطلون", elbow),
                                                Expanded(
                                                  child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) =>
                                                            InkWell(
                                                      onTap: () {
                                                        setState(() {});
                                                        pocketslistValue =
                                                            attribut
                                                                .result!
                                                                .pocketslist![
                                                                    index]
                                                                .id!;
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Image.network(
                                                            attribut
                                                                .result!
                                                                .pocketslist![
                                                                    index]
                                                                .image!,
                                                            width: 40,
                                                            height: 40,
                                                            color: globalColor
                                                                .primaryColor,
                                                          ),
                                                          // Text(attribut.result.pocketslist[index].name),
                                                          Radio(
                                                            value: attribut
                                                                .result!
                                                                .pocketslist![
                                                                    index]
                                                                .id!,
                                                            groupValue:
                                                                pocketslistValue,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                pocketslistValue =
                                                                    value!
                                                                        as int;
                                                              });
                                                              print("aaaaaaaaaaaaaaaaaa" +
                                                                  value
                                                                      .toString());
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    itemCount: attribut.result!
                                                        .pocketslist!.length,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "نوع اليد",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                  color: Colors.black,

                                                  fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  typehandlistValue = attribut
                                                      .result!
                                                      .typehandlist![index]
                                                      .id!;
                                                },
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      attribut
                                                          .result!
                                                          .typehandlist![index]
                                                          .image!,
                                                      width: 40,
                                                      height: 40,
                                                      color: globalColor
                                                          .primaryColor,
                                                    ),
                                                    SizedBox(height:  MediaQuery.of(context).size.height*.03,),
                                                    Text(attribut
                                                        .result!
                                                        .typehandlist![index]
                                                        .name!),
                                                    Radio(
                                                      value: attribut
                                                          .result!
                                                          .typehandlist![index]
                                                          .id!,
                                                      groupValue:
                                                          typehandlistValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          typehandlistValue =
                                                              value! as int;
                                                        });
                                                        print(
                                                            "aaaaaaaaaaaaaaaaaa" +
                                                                value
                                                                    .toString());
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              itemCount: attribut
                                                  .result!.typehandlist!.length,
                                            ),
                                          ),
                                          /*Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "الاكسسوارات",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                      color: globalColor
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  // collarlistValue
                                                  accnumlistValue = attribut
                                                      .result!
                                                      .accnumlist![index]
                                                      .id!;
                                                },
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      attribut
                                                          .result!
                                                          .accnumlist![index]
                                                          .image!,
                                                      width: 40,
                                                      height: 40,
                                                      color: globalColor
                                                          .primaryColor,
                                                    ),
                                                    Text(attribut
                                                        .result!
                                                        .accnumlist![index]
                                                        .name!),
                                                    Radio(
                                                      value: attribut
                                                          .result!
                                                          .accnumlist![index]
                                                          .id!,
                                                      groupValue:
                                                          accnumlistValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          accnumlistValue =
                                                              value! as int;
                                                        });
                                                        print(
                                                            "aaaaaaaaaaaaaaaaaa" +
                                                                value
                                                                    .toString());
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              itemCount: attribut
                                                  .result!.accnumlist!.length,
                                            ),
                                          ),*/    //      ***********************     سليم *********************************
                                          /*Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "نوع القماش",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                      color: globalColor
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  fabricslistValue = attribut
                                                      .result!
                                                      .fabricslist![index]
                                                      .id!;
                                                },
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      attribut
                                                          .result!
                                                          .fabricslist![index]
                                                          .image!,
                                                      width: 40,
                                                      height: 40,
                                                      color: globalColor
                                                          .primaryColor,
                                                    ),
                                                    SizedBox(height:  MediaQuery.of(context).size.height*.03,),
                                                    Text(attribut
                                                        .result!
                                                        .fabricslist![index]
                                                        .name!),
                                                    Radio(
                                                      value: attribut
                                                          .result!
                                                          .fabricslist![index]
                                                          .id!,
                                                      groupValue:
                                                          fabricslistValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          fabricslistValue =
                                                              value! as int;
                                                        });
                                                        print(
                                                            "aaaaaaaaaaaaaaaaaa" +
                                                                value
                                                                    .toString());
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              itemCount: attribut
                                                  .result!.fabricslist!.length,
                                            ),
                                          ),*/
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "نوع الاكسسوارت",
                                              style: textStyle.middleTSBasic
                                                  .copyWith(
                                                      color: Colors.black ,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                          Container(
                                            height: 140,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  InkWell(
                                                onTap: () {
                                                  setState(() {});
                                                  acctypeslistValue = attribut
                                                      .result!
                                                      .acctypeslist![index]
                                                      .id!;
                                                },
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      attribut
                                                          .result!
                                                          .acctypeslist![index]
                                                          .image!,
                                                      width: 40,
                                                      height: 40,
                                                      color: globalColor
                                                          .primaryColor,
                                                    ),
                                                    SizedBox(height:  MediaQuery.of(context).size.height*.03,),
                                                    Text(attribut
                                                        .result!
                                                        .acctypeslist![index]
                                                        .name!),
                                                    Radio(
                                                      value: attribut
                                                          .result!
                                                          .acctypeslist![index]
                                                          .id!,
                                                      groupValue:
                                                          acctypeslistValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          acctypeslistValue =
                                                              value! as int;
                                                        });
                                                        print(
                                                            "aaaaaaaaaaaaaaaaaa" +
                                                                value
                                                                    .toString());
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              itemCount: attribut
                                                  .result!.acctypeslist!.length,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          HorizontalPadding(percentage: 2),
                                          Expanded(
                                            child: OutlineButton(
                                              disabledBorderColor:
                                                  globalColor.black,
                                              borderSide: BorderSide(
                                                width: .5,
                                                color: Colors.black,
                                                style: BorderStyle.solid,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderAttribute(),
                                                    ));
                                              },
                                              child: Text(
                                                "اون لاين",
                                                style: textStyle.middleTSBasic
                                                    .copyWith(
                                                  color: globalColor.grey,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                          HorizontalPadding(percentage: 2),
                                          Expanded(
                                            child: RaisedButton(
                                              color: globalColor.primaryColor,
                                              textColor: Colors.white,
                                              // color: Colors.greenAccent,
                                              // borderSide: BorderSide(
                                              //   width: .5,
                                              //   color: Colors.black,
                                              //   style:
                                              //   BorderStyle.solid,
                                              // ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              onPressed: () {
                                                if (typehandlistValue == null ||
                                                    tailorslistValue == null ||
                                                    tailorslistValue == null ||
                                                    pocketslistValue == null ||
                                                    acctypeslistValue == null ||
                                                    // fabricslistValue == null ||
                                                    // accnumlistValue == null ||
                                                    // additionslistValue == null ||
                                                   // embroiderylistValue == null ||    *********** تطريز سليم  **********
                                                    collarlistValue == null ||
                                                    fillingtypeList == null ||
                                                    // gypsourValue == null ||
                                                    thawbNumber.text == "" ||
                                                    length.text == "" ||
                                                    // waist.text == "" ||
                                                    chest.text == "" ||
                                                    shoulder.text == "" ||
                                                    handLength.text == "" ||
                                                    neck.text == "" ||
                                                    bat.text == "" ||
                                                    Belowbat.text == "" ||
                                                    jisor.text == "" ||
                                                    step.text == "" ||
                                                    elbow.text == "") {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "يرجي استكمال البيانات",
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.CENTER,
                                                      timeInSecForIosWeb: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                } else {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => ConfirmAttripute(
                                                            filling:
                                                                fillingtypeList,
                                                            gypsourType:
                                                                gypsourValue,
                                                            count_item:
                                                                int.parse(
                                                                    thawbNumber
                                                                        .text),
                                                            length: int.parse(
                                                                length.text),
                                                            // waist: int.parse(
                                                            //     waist.text),
                                                            chest: int.parse(
                                                                chest.text),
                                                            shoulder: int.parse(
                                                                shoulder.text),
                                                            hand: int.parse(
                                                                handLength
                                                                    .text),
                                                            neck: int.parse(neck.text),
                                                            armpit: int.parse(bat.text),
                                                            elbow: int.parse(Belowbat.text),
                                                            gypsour: int.parse(jisor.text),
                                                            step: int.parse(step.text),
                                                            pocket_type: int.parse(pocketslistValue.toString()),
                                                            type_hand: int.parse(typehandlistValue.toString()),
                                                            tailor_id: int.parse(tailorslistValue.toString()),
                                                            model_id: int.parse(tailorslistValue.toString()),
                                                            pocket_id: int.parse(pocketslistValue.toString()),
                                                            acctype_id: int.parse(acctypeslistValue.toString()),
                                                            // fabric_id: int.parse(fabricslistValue.toString()),
                                                            // accnum_id: int.parse(accnumlistValue.toString()),
                                                            // addition_id: int.parse(additionslistValue.toString()),
                                                           // embroidery_id: int.parse(embroiderylistValue.toString()),   *********** تطريز سليم  **********
                                                            collar_id: int.parse(collarlistValue.toString())),
                                                      ));
                                                }

                                                // storeOrder(name: null, phone: null, address: null, count_item: null, length: null, waist: null, chest: null, shoulder: null, hand: null, neck: null, armpit: null, elbow: null, gypsour: null, step: null, pocket_type: null, type_hand: null, tailor_id: null, model_id: null, pocket_id: null, acctype_id: null, fabric_id: null, accnum_id: null, addition_id: null, collar_id: null, note: null)
                                              },
                                              child: Text(
                                                "استكمال الطلب",
                                                style: textStyle.middleTSBasic
                                                    .copyWith(
                                                  color: globalColor.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                          HorizontalPadding(percentage: 2),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text(snapshot.error.toString()));
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
          )
        : Scaffold(
            // appBar: appBar,
            backgroundColor: globalColor.scaffoldBackGroundGreyColor,
            body: adds == []
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  )
                : Container(
                    // width: width,
                    // height: height,
                    // key: _listKey,
                    child: Center(
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                          margin: const EdgeInsets.all(EdgeMargin.big),
                          padding: const EdgeInsets.all(EdgeMargin.small),
                          decoration: ShapeDecoration(
                              color: globalColor.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(10)))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                '${Translations.of(context).translate('disclaimer')}',
                                style: textStyle.bigTSBasic.copyWith(
                                    color: globalColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: EdgeMargin.subMin,
                                    right: EdgeMargin.subMin,
                                    top: EdgeMargin.subMin),
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  '${Translations.of(context).translate('msg_disclaimer')}',
                                  style: textStyle.minTSBasic.copyWith(
                                      color: globalColor.black,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              VerticalPadding(
                                percentage: 1.5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: ButtonTheme(
                                          height: 50.h,
                                          minWidth: 130.w,
                                          child: RaisedButton(
                                              color: globalColor.primaryColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
                                              splashColor:
                                                  Colors.white.withAlpha(40),
                                              child: Text(
                                                '${Translations.of(context).translate('login')}',
                                                textAlign: TextAlign.center,
                                                style: textStyle.minTSBasic
                                                    .copyWith(
                                                        color:
                                                            globalColor.white),
                                              ),
                                              onPressed: () {
                                                Get.Get.back();
                                                Get.Get.toNamed(
                                                    SignInPage.routeName);
                                              })),
                                    ),
                                  ),
                                  HorizontalPadding(
                                    percentage: 2,
                                  ),
                                  Expanded(
                                    child: Container(
                                        child: ButtonTheme(
                                            height: 50.h,
                                            minWidth: 136.w,
                                            child: RaisedButton(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0)),
                                                splashColor:
                                                    Colors.white.withAlpha(40),
                                                child: Text(
                                                  Translations.of(context)
                                                      .translate(
                                                          'register_as_guest'),
                                                  textAlign: TextAlign.center,
                                                  style: textStyle.minTSBasic
                                                      .copyWith(
                                                          color: globalColor
                                                              .black),
                                                ),
                                                onPressed: () {
                                                  Get.Get.back();
                                                }))),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ),
                  )),
          );
  }

  customTextField(title, textController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Container(
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: globalColor.grey.withOpacity(.2)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Text(
                  title,
                  style:
                      textStyle.smallTSBasic.copyWith(color: globalColor.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              width: 80,
              height: 50,
              child: TextFormField(
                validator: (v) {
                  if (v!.length == 0) {
                    return "";
                  }
                  return null;
                },
                controller: textController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: globalColor.primaryColor),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: globalColor.primaryColor),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "",
                    fillColor: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  customTextWithColor(title) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: globalColor.grey.withOpacity(.2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Text(
          title,
          style: textStyle.smallTSBasic.copyWith(color: globalColor.grey),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _buildTopAds(
      {
      //required GeneralProductModel productModel,
      required BuildContext context,
      required double width,
      required double height}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // color: Colors.green,
      width: width,
      height: 150.h,
      child: Stack(
        children: [
          PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: adds
                .map((item) => ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: ItemOfferWidget(
                        offerItem: item,
                        width: width,
                      ),
                    ))
                .toList(),
          ),
          Positioned(
              bottom: 8,
              right: 0,
              left: 0,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: _buildPageIndicator2(width: width, count: 5)))
        ],
      ),
    );
  }

  _buildPageIndicator2({double? width, int? count}) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: width,
      child: SmoothPageIndicator(
          controller: controller, //// PageController
          count: count!,
          effect: WormEffect(
            spacing: 8.0,
            radius: 9.0,
            dotWidth: 8.0,
            dotHeight: 8.0,
            dotColor: Colors.white,
            paintStyle: PaintingStyle.fill,
            strokeWidth: 2,
            activeDotColor: globalColor.primaryColor,
          ), // your preferred effect
          onDotClicked: (index) {}),
    );
  }
}

class dropdownWidget extends StatelessWidget {
  const dropdownWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AwesomeDropDown(
      dropDownList: ["صغير", "لارج", "اكس لارج", "اكس لارج2", "اكس لارج3",],
      padding: 8,
      dropDownIcon: Icon(
        Icons.arrow_drop_down,
        color: Colors.grey,
        size: 23,
      ),
      elevation: 5,
      dropDownBorderRadius: 10,
      dropDownTopBorderRadius: 50,
      dropDownBottomBorderRadius: 50,
      dropDownIconBGColor: Colors.transparent,
      dropDownOverlayBGColor: Colors.transparent,
      dropDownBGColor: Colors.white,
      selectedItem: 'أختر مقاسك',
      numOfListItemToShow: 4,
      selectedItemTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold),
      dropDownListTextStyle: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.transparent),
    );
  }
}
