import 'bloc/bookmarks_bloc.dart';
import 'models/bookmarks_model.dart';
import 'package:codefusion/core/app_export.dart';
import 'package:codefusion/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<BookmarksBloc>(
        create: (context) =>
            BookmarksBloc(BookmarksState(bookmarksModelObj: BookmarksModel()))
              ..add(BookmarksInitialEvent()),
        child: BookmarksScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 10.h, top: 68.v, right: 10.h),
                child: Column(children: [
                  _buildStatusBar(context),
                  SizedBox(height: 28.v),
                  Padding(
                      padding: EdgeInsets.only(left: 2.h, right: 4.h),
                      child: BlocSelector<BookmarksBloc, BookmarksState,
                              TextEditingController?>(
                          selector: (state) => state.searchController,
                          builder: (context, searchController) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "lbl_bookmarks".tr);
                          })),
                  SizedBox(height: 16.v),
                  _buildAll(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildEighteen(context)));
  }

  /// Section Widget
  Widget _buildStatusBar(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 26.h, right: 23.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 6.v),
              child: Text("lbl_9_41".tr,
                  style: CustomTextStyles.titleMediumSFProTextBlack900)),
          Spacer(flex: 65),
          Container(
              height: 36.v,
              width: 122.h,
              padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 12.v),
              decoration: AppDecoration.fillBlack
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLock,
                  height: 11.adaptSize,
                  width: 11.adaptSize,
                  alignment: Alignment.topRight)),
          Spacer(flex: 34),
          CustomImageView(
              imagePath: ImageConstant.imgSettings,
              height: 12.v,
              width: 18.h,
              margin: EdgeInsets.symmetric(vertical: 12.v)),
          CustomImageView(
              imagePath: ImageConstant.imgSettingsBlack900,
              height: 11.v,
              width: 17.h,
              margin: EdgeInsets.only(left: 8.h, top: 12.v, bottom: 12.v)),
          Padding(
              padding: EdgeInsets.only(left: 7.h, top: 11.v, bottom: 12.v),
              child: SizedBox(
                  height: 13.v,
                  width: 25.h,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.h),
                      child: LinearProgressIndicator(
                          value: 0.84,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              appTheme.black900))))),
          Opacity(
              opacity: 0.4,
              child: CustomImageView(
                  imagePath: ImageConstant.imgBatteryEnd,
                  height: 4.v,
                  width: 1.h,
                  margin: EdgeInsets.only(left: 1.h, top: 16.v, bottom: 15.v)))
        ]));
  }

  /// Section Widget
  Widget _buildAll(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 4.h),
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 21.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("lbl_kotlin_icons".tr,
                  style: CustomTextStyles.titleLargeRalewayBlack900),
              SizedBox(height: 4.v),
              Text("msg_how_to_put_the_icons".tr,
                  style: theme.textTheme.bodyMedium),
              SizedBox(height: 21.v),
              Divider(),
              SizedBox(height: 3.v)
            ]));
  }

  /// Section Widget
  Widget _buildEighteen(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 31.v),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
              onTap: () {
                onTapImageSix(context);
              },
              child: Container(
                  height: 43.adaptSize,
                  width: 43.adaptSize,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.imgImage6),
                          fit: BoxFit.cover)))),
          Container(
              height: 43.adaptSize,
              width: 43.adaptSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageConstant.imgImage543x43),
                      fit: BoxFit.cover)))
        ]));
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapImageSix(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchScreen,
    );
  }
}
