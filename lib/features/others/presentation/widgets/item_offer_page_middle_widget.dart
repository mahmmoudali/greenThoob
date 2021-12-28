import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ojos_app/core/entities/offer_item_entity.dart';
import 'package:ojos_app/core/localization/translations.dart';
import 'package:ojos_app/core/res/edge_margin.dart';
import 'package:ojos_app/core/res/global_color.dart';
import 'package:ojos_app/core/res/text_style.dart';
import 'package:ojos_app/core/ui/widget/image/image_caching.dart';
import 'package:get/get.dart' as Get;
import 'package:ojos_app/features/product/data/models/product_model.dart';
import 'package:ojos_app/features/product/domin/entities/product_entity.dart';
import 'package:ojos_app/features/product/presentation/args/product_details_args.dart';
import 'package:ojos_app/features/product/presentation/pages/lenses_details_page.dart';
import 'package:ojos_app/features/product/presentation/pages/product_details_page.dart';

class ItemOfferMiddlePageWidget extends StatelessWidget {
  final OfferItemEntity offerItem;
  final double width;

  const ItemOfferMiddlePageWidget(
      {required this.offerItem, required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (offerItem.is_glasses != null && offerItem.is_glasses!)
          Get.Get.toNamed(ProductDetailsPage.routeName,
              preventDuplicates: false,
              arguments: ProductDetailsArguments(
                  product: ProductEntity(
                      id: 1,
                      name: offerItem.name,
                      category_id: 1,
                      image: '',
                      is_new: false,
                      isReview: false,
                      isFavorite: false,
                      quantity: 0,
                      review_count: 0,
                      discount_price: offerItem.discountPrice ?? 0,
                      discount_type: '',
                      description: '',
                      price: offerItem.discountPrice,
                      rate: '',
                      product_as_same: [])));
        else
          Get.Get.toNamed(LensesDetailsPage.routeName,
              preventDuplicates: false,
              arguments: ProductDetailsArguments(
                  product: ProductEntity(
                      id: 1,
                      name: offerItem.name,
                      category_id: 0,
                      image: '',
                      is_new: false,
                      isReview: false,
                      isFavorite: false,
                      quantity: 0,
                      review_count: 0,
                      discount_price: offerItem.discountPrice ?? 0,
                      discount_type: '',
                      description: '',
                      price: offerItem.discountPrice,
                      rate: '',
                      product_as_same: [])));
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              EdgeMargin.small, 0.0, EdgeMargin.small, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(width * .04)),
            child: Container(
              color: globalColor.white,
              child: Stack(
                children: [
                  Container(
                    width: width,
                    height: 189.h,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: ImageCacheWidget(
                              imageUrl: offerItem.image ?? '',
                              imageWidth: width,
                              imageHeight: 189.h,
                              boxFit: BoxFit.fill,
                              imageBorderRadius: width * .04,
                            ),
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.centerStart,
                          padding: const EdgeInsets.fromLTRB(
                              EdgeMargin.sub, 0.0, EdgeMargin.sub, 0.0),
                          child: Text(
                            offerItem.name ?? '',
                            style: textStyle.smallTSBasic.copyWith(
                                color: globalColor.black,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  offerItem.discountType != null
                      ? Container(
                          width: width,
                          padding: const EdgeInsets.fromLTRB(
                              EdgeMargin.sub, 0.0, EdgeMargin.sub, 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(''),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: globalColor.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.w)),
                                          border: Border.all(
                                              color: globalColor.grey
                                                  .withOpacity(0.3),
                                              width: 0.5)),
                                      padding: const EdgeInsets.fromLTRB(
                                          EdgeMargin.subSubMin,
                                          EdgeMargin.verySub,
                                          EdgeMargin.subSubMin,
                                          EdgeMargin.verySub),
                                      child: offerItem.discountType == 1
                                          ? Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  '${offerItem.discountPrice ?? '-'} ${Translations.of(context).translate('rail')}',
                                                  style: textStyle.smallTSBasic
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: globalColor
                                                              .primaryColor),
                                                ),
                                                Text(
                                                    ' ${Translations.of(context).translate('discount')}',
                                                    style: textStyle.minTSBasic
                                                        .copyWith(
                                                            color: globalColor
                                                                .black)),
                                              ],
                                            )
                                          : Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${offerItem.discountPrice ?? '-'} %',
                                                  style: textStyle.smallTSBasic
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: globalColor
                                                              .primaryColor),
                                                ),
                                                Text(
                                                    ' ${Translations.of(context).translate('discount')}',
                                                    style: textStyle.minTSBasic
                                                        .copyWith(
                                                            color: globalColor
                                                                .black)),
                                              ],
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                              Text('')
                            ],
                          ),
                        )
                      : Container(),
                  // Align(
                  //   alignment:
                  //   AlignmentDirectional.centerEnd,
                  //   child: Diagonal(
                  //     clipHeight: 45.0,
                  //     axis: Axis.vertical,
                  //     position: DiagonalPosition.TOP_RIGHT,
                  //     child: Container(
                  //       width: width * .3,
                  //       height: 184.h,
                  //       color: globalColor.primaryColor,
                  //       child: Column(
                  //         crossAxisAlignment:
                  //         CrossAxisAlignment.end,
                  //         children: [
                  //
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
