import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ojos_app/core/appConfig.dart';

import 'package:ojos_app/core/errors/connection_error.dart';
import 'package:ojos_app/core/localization/translations.dart';
import 'package:ojos_app/core/res/global_color.dart';
import 'package:ojos_app/core/res/text_style.dart';
import 'package:ojos_app/features/order/domain/entities/general_order_item_entity.dart';
import 'package:ojos_app/features/order/presentation/blocs/order_online_ploc.dart';

import 'item_order_online.dart';
import 'order_page_shimmer.dart';

class BasicOrderListPageOnline extends StatefulWidget {
  final double width;
  final double height;
  final Map<String, String> filterParams;

  const BasicOrderListPageOnline(
      {required this.width, required this.height, required this.filterParams});

  @override
  _BasicOrderListPageOnlineState createState() =>
      _BasicOrderListPageOnlineState();
}

class _BasicOrderListPageOnlineState extends State<BasicOrderListPageOnline>
    with AutomaticKeepAliveClientMixin<BasicOrderListPageOnline> {
  var _cancelToken = CancelToken();

  GlobalKey _key = GlobalKey();
  int selectedStep = 0;
  int nbSteps = 4;

  List<GeneralOrderItemEntity> listOfData = [];
  var _orderBloc = OrderBlocOnline();
  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _orderBloc.add(GetOrderEvent(
      cancelToken: _cancelToken,
      filterParams: widget.filterParams,
    ));
  }

  @override
  Widget build(BuildContext context) {
    //print("aaaa" + widget.filterParams["order_status"]);
    super.build(context);
    return BlocListener<OrderBlocOnline, OrderState>(
      bloc: _orderBloc,
      listener: (BuildContext context, state) async {
        if (state is OrderDoneState) {
          // _navigateTo(context, state.extraGlassesEntity);
          listOfData = state.orders;
        }
        if (state is DoneDeleteOrder) {
          appConfig.showToast(
              msg: Translations.of(context)
                  .translate('order_successfully_deleted'));
        }
        if (state is FailureDeleteOrder) {
          appConfig.showToast(
              msg: Translations.of(context).translate('order_failed_added'));
        }
      },
      child: BlocBuilder<OrderBlocOnline, OrderState>(
          bloc: _orderBloc,
          builder: (BuildContext context, state) {
            if (state is OrderFailureState) {
              return Container(
                width: widget.width,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                            (state.error is ConnectionError)
                                ? Translations.of(context)
                                    .translate('err_connection')
                                : Translations.of(context)
                                    .translate('err_unexpected'),
                            style: textStyle.normalTSBasic
                                .copyWith(color: globalColor.accentColor)),
                      ),
                      RaisedButton(
                        onPressed: () {
                          _orderBloc.add(GetOrderEvent(
                              cancelToken: _cancelToken,
                              filterParams: widget.filterParams));
                        },
                        elevation: 1.0,
                        child: Text(Translations.of(context).translate('retry'),
                            style: textStyle.smallTSBasic
                                .copyWith(color: globalColor.white)),
                        color: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is OrderDoneState) {
              if (state.orders != null && state.orders.isNotEmpty) {
                return Container(
                  key: _globalKey,
                  width: widget.width,
                  height: widget.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Container(
                        //   alignment: AlignmentDirectional.centerStart,
                        //   padding: const EdgeInsets.only(
                        //       left: EdgeMargin.min, right: EdgeMargin.min),
                        //   child: Text(
                        //     Translations.of(context)
                        //         .translate('order_tracking'),
                        //     style: textStyle.smallTSBasic.copyWith(
                        //         color: globalColor.black,
                        //         fontWeight: FontWeight.w600),
                        //   ),
                        // ),
                        // Container(
                        //     key: _key,
                        //     margin: const EdgeInsets.only(
                        //       left: EdgeMargin.min,
                        //       right: EdgeMargin.min,
                        //     ),
                        //     height: widget.height * .16,
                        //     child: _buildStepWidget(
                        //         context: context, width: widget.width)),
                        Container(
                          child: ListView.builder(
                            itemCount: listOfData.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return (listOfData[index].status == "canceled" &&
                                      widget.filterParams["order_status"] ==
                                          "new")
                                  ? SizedBox.shrink()
                                  : ItemOrderWidgetOnline(
                                      orderItem: listOfData[index],
                                      cancelToken: _cancelToken,
                                      onUpdate: _onUpdate,
                                      orderBloc: _orderBloc,
                                      filterparams: widget.filterParams);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Container(
                  width: widget.width,
                  height: widget.height,
                  child: Center(
                    child: Text(
                      '${Translations.of(context).translate('there_are_no_orders')}',
                      style: textStyle.smallTSBasic
                          .copyWith(color: globalColor.primaryColor),
                    ),
                  ),
                );
              }
            }
            return Container(
                width: widget.width,
                height: widget.height,
                child: OrderPageShimmer(
                  width: widget.width,
                  height: widget.height,
                ));
          }),
    );
  }

  _onUpdate() {
    _globalKey = GlobalKey();
    if (mounted) setState(() {});
  }

  // _buildStepWidget({BuildContext context, double width}) {
  //   return Container(
  //     width: width,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(
  //               color: globalColor.white,
  //               borderRadius: BorderRadius.all(Radius.circular(12.w)),
  //               border: Border.all(
  //                   color: globalColor.grey.withOpacity(0.2), width: 1.0)),
  //           width: 73.w,
  //           height: 60,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                     color: globalColor.goldColor,
  //                     shape: BoxShape.circle,
  //                     border: Border.all(
  //                         color: globalColor.primaryColor, width: 1.0)),
  //                 width: 24.w,
  //                 height: 24.w,
  //                 child: Icon(
  //                   MaterialIcons.check,
  //                   color: globalColor.black,
  //                   size: 10.w,
  //                 ),
  //               ),
  //               Container(
  //                 child: Text(
  //                   Translations.of(context).translate('recipient'),
  //                   style: textStyle.subMinTSBasic.copyWith(
  //                       color: globalColor.black, fontWeight: FontWeight.bold),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //             child: Container(
  //               height: 1.0,
  //               color: globalColor.primaryColor,
  //             )),
  //         Container(
  //           decoration: BoxDecoration(
  //               color: globalColor.white,
  //               borderRadius: BorderRadius.all(Radius.circular(12.w)),
  //               border: Border.all(
  //                   color: globalColor.grey.withOpacity(0.2), width: 1.0)),
  //           width: 73.w,
  //           height: 60,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                     color: globalColor.grey.withOpacity(0.2),
  //                     shape: BoxShape.circle,
  //                     border: Border.all(
  //                         color: globalColor.grey.withOpacity(0.2),
  //                         width: 1.0)),
  //                 width: 24.w,
  //                 height: 24.w,
  //               ),
  //               Container(
  //                 child: Text(
  //                   Translations.of(context).translate('in_progress'),
  //                   style: textStyle.subMinTSBasic.copyWith(
  //                       color: globalColor.black, fontWeight: FontWeight.bold),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //             child: Container(
  //               height: 1.0,
  //               color: globalColor.grey.withOpacity(0.2),
  //             )),
  //         Container(
  //           decoration: BoxDecoration(
  //               color: globalColor.white,
  //               borderRadius: BorderRadius.all(Radius.circular(12.w)),
  //               border: Border.all(
  //                   color: globalColor.grey.withOpacity(0.2), width: 1.0)),
  //           width: 73.w,
  //           height: 60,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                     color: globalColor.grey.withOpacity(0.2),
  //                     shape: BoxShape.circle,
  //                     border: Border.all(
  //                         color: globalColor.grey.withOpacity(0.2),
  //                         width: 1.0)),
  //                 width: 24.w,
  //                 height: 24.w,
  //               ),
  //               Container(
  //                 child: Text(
  //                   Translations.of(context).translate('on_way'),
  //                   style: textStyle.subMinTSBasic.copyWith(
  //                       color: globalColor.black, fontWeight: FontWeight.bold),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         Expanded(
  //             child: Container(
  //               height: 1.0,
  //               color: globalColor.grey.withOpacity(0.2),
  //             )),
  //         Container(
  //           decoration: BoxDecoration(
  //               color: globalColor.white,
  //               borderRadius: BorderRadius.all(Radius.circular(12.w)),
  //               border: Border.all(
  //                   color: globalColor.grey.withOpacity(0.2), width: 1.0)),
  //           width: 73.w,
  //           height: 60,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Container(
  //                 decoration: BoxDecoration(
  //                     color: globalColor.grey.withOpacity(0.2),
  //                     shape: BoxShape.circle,
  //                     border: Border.all(
  //                         color: globalColor.grey.withOpacity(0.2),
  //                         width: 1.0)),
  //                 width: 24.w,
  //                 height: 24.w,
  //               ),
  //               Container(
  //                 child: Text(
  //                   Translations.of(context).translate('delivered'),
  //                   style: textStyle.subMinTSBasic.copyWith(
  //                       color: globalColor.black, fontWeight: FontWeight.bold),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _orderBloc.close();
    _cancelToken.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
