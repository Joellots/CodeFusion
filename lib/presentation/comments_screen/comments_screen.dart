import '../comments_screen/widgets/userreview_item_widget.dart';
import 'bloc/comments_bloc.dart';
import 'models/comments_model.dart';
import 'models/userreview_item_model.dart';
import 'package:codefusion/core/app_export.dart';
import 'package:codefusion/widgets/custom_elevated_button.dart';
import 'package:codefusion/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CommentsBloc>(
        create: (context) =>
            CommentsBloc(CommentsState(commentsModelObj: CommentsModel()))
              ..add(CommentsInitialEvent()),
        child: CommentsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 31.v),
                child: Column(children: [
                  SizedBox(height: 37.v),
                  _buildStatusBar(context),
                  SizedBox(height: 34.v),
                  _buildNavbar(context),
                  SizedBox(height: 14.v),
                  _buildUserReview(context),
                  Spacer(),
                  CustomImageView(
                      imagePath: ImageConstant.imgComponent3,
                      height: 43.v,
                      width: 382.h,
                      onTap: () {
                        onTapImgImage(context);
                      })
                ]))));
  }

  /// Section Widget
  Widget _buildStatusBar(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 27.h, right: 24.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                margin: EdgeInsets.only(left: 8.h, top: 12.v, bottom: 12.v))
          ])),
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
  Widget _buildNavbar(BuildContext context) {
    return Container(
        width: 406.h,
        margin: EdgeInsets.symmetric(horizontal: 3.h),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.v),
              Padding(
                  padding: EdgeInsets.only(right: 7.h),
                  child: BlocSelector<CommentsBloc, CommentsState,
                          TextEditingController?>(
                      selector: (state) => state.titleTableController,
                      builder: (context, titleTableController) {
                        return CustomTextFormField(
                            controller: titleTableController,
                            hintText: "lbl_kotlin_icons".tr,
                            hintStyle: theme.textTheme.titleSmall!,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.h, vertical: 7.v),
                            borderDecoration:
                                TextFormFieldStyleHelper.outlineGray);
                      })),
              SizedBox(height: 10.v),
              Padding(
                  padding: EdgeInsets.only(right: 7.h),
                  child: BlocSelector<CommentsBloc, CommentsState,
                          TextEditingController?>(
                      selector: (state) => state.commentController,
                      builder: (context, commentController) {
                        return CustomTextFormField(
                            controller: commentController,
                            hintText: "lbl_add_a_comment".tr,
                            textInputAction: TextInputAction.done,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.h, vertical: 7.v));
                      })),
              SizedBox(height: 9.v),
              CustomElevatedButton(
                  height: 21.v,
                  width: 46.h,
                  text: "lbl_send".tr,
                  buttonStyle: CustomButtonStyles.outlineBlack,
                  buttonTextStyle: theme.textTheme.labelMedium!)
            ]));
  }

  /// Section Widget
  Widget _buildUserReview(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 3.h),
        child: BlocSelector<CommentsBloc, CommentsState, CommentsModel?>(
            selector: (state) => state.commentsModelObj,
            builder: (context, commentsModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16.v);
                  },
                  itemCount: commentsModelObj?.userreviewItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    UserreviewItemModel model =
                        commentsModelObj?.userreviewItemList[index] ??
                            UserreviewItemModel();
                    return UserreviewItemWidget(model);
                  });
            }));
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapImgImage(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchScreen,
    );
  }
}
