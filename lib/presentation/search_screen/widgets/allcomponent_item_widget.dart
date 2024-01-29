import '../models/allcomponent_item_model.dart';
import 'package:codefusion/core/app_export.dart';
import 'package:flutter/material.dart' hide SearchController;

// ignore: must_be_immutable
class AllcomponentItemWidget extends StatelessWidget {
  AllcomponentItemWidget(
    this.allcomponentItemModelObj, {
    Key? key,
    this.onTapImgKotlinIconsImage,
    this.onTapImgKotlinIconsImage1,
  }) : super(
          key: key,
        );

  AllcomponentItemModel allcomponentItemModelObj;

  VoidCallback? onTapImgKotlinIconsImage;

  VoidCallback? onTapImgKotlinIconsImage1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 17.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      allcomponentItemModelObj.kotlinIconsText!,
                      style: CustomTextStyles.titleLargeRalewayBlack900,
                    ),
                    SizedBox(height: 4.v),
                    Text(
                      allcomponentItemModelObj.howToPutTheIconsText!,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgStar,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(
                    top: 12.v,
                    bottom: 10.v,
                  ),
                  onTap: () {
                    onTapImgKotlinIconsImage!.call();
                  },
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgMenuItemDesktop,
                  height: 44.v,
                  width: 24.h,
                  margin: EdgeInsets.only(
                    left: 16.h,
                    top: 2.v,
                  ),
                  onTap: () {
                    onTapImgKotlinIconsImage1!.call();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: Text(
              allcomponentItemModelObj.ratingText!,
              style: theme.textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
