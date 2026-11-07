import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:deliveryapplication/core/constant/image_assest.dart';
import 'package:deliveryapplication/core/constant/status_requset.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class HandlindDataView extends StatelessWidget {
  StatusRequset statusRequset;
  Widget widget;
  HandlindDataView({
    super.key,
    required this.statusRequset,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequset == StatusRequset.loading
        ? Center(
            child: Lottie.asset(
              ImageAssest.loadinglottie,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color([
                    '**',
                  ], value: ColorConstant.puplerDistinct),
                ],
              ),
            ),
          )
        : statusRequset == StatusRequset.OfflineFailure
        ? Center(
            child: Lottie.asset(
              ImageAssest.errorlottie,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color([
                    '**',
                  ], value: ColorConstant.puplerDistinct),
                ],
              ),
            ),
          )
        : statusRequset == StatusRequset.serviceFailure
        ? Container(
            margin: EdgeInsets.only(top: 170),
            child: Center(child: Lottie.asset(ImageAssest.noDataFoundlottie)),
          )
        : statusRequset == StatusRequset.failure
        ? Container(
            margin: EdgeInsets.only(top: 170),
            child: Center(
              child: Lottie.asset(
                ImageAssest.errorlottie,
                delegates: LottieDelegates(
                  values: [
                    ValueDelegate.color([
                      '**',
                    ], value: ColorConstant.puplerDistinct),
                  ],
                ),
              ),
            ),
          )
        : widget;
  }
}
