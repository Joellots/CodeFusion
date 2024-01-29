import '../models/userreview_item_model.dart';
import 'package:codefusion/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserreviewItemWidget extends StatelessWidget {
  UserreviewItemWidget(
    this.userreviewItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserreviewItemModel userreviewItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6.v),
          Text(
            userreviewItemModelObj.userName!,
            style: CustomTextStyles.titleMediumRalewayBlueA700,
          ),
          SizedBox(height: 9.v),
          SizedBox(
            width: 234.h,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "msg_liked_this_page2".tr,
                    style: CustomTextStyles.bodyMediumff757575,
                  ),
                  TextSpan(
                    text: "lbl_rating_9_9".tr,
                    style: CustomTextStyles.labelLargeff757575,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 16.v),
          Divider(),
        ],
      ),
    );
  }
}
