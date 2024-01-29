import '../search_screen/widgets/allcomponent_item_widget.dart';
import 'bloc/search_bloc.dart';
import 'models/allcomponent_item_model.dart';
import 'models/search_model.dart' as MODL; // Add an alias for the import
import 'package:codefusion/core/app_export.dart';
import 'package:codefusion/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:codefusion/presentation/search_screen/bloc/search_bloc.dart' as BLOC;

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(SearchState(searchModelObj: MODL.SearchModel()))..add(SearchInitialEvent()),
      child: SearchScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 35.v),
          child: Column(
            children: [
              SizedBox(height: 33.v),
              _buildStatusBar(context),
              SizedBox(height: 28.v),
              Padding(
                padding: EdgeInsets.only(left: 2.h, right: 4.h),
                child: BlocSelector<BLOC.SearchBloc, BLOC.SearchState, TextEditingController?>(
                  selector: (state) => state.searchController,
                  builder: (context, searchController) {
                    return CustomSearchView(
                      controller: searchController,
                      hintText: "lbl_search".tr,
                      onUserInput: (String value) {
                        context.read<BLOC.SearchBloc>().add(BLOC.SearchInputEvent(value));
                      },
                    );
                  },
                ),
              ),
              // SizedBox(height: 16.v),
              // _buildAllComponent(context),
              // Spacer(),
              // _buildSeventeen(context),
            ],
          ),
        ),
      ),
    );
  }
  /// Section Widget
  Widget _buildStatusBar(BuildContext context) {
    return SizedBox(
        height: 36.v,
        width: 360.h,
        child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 6.v),
                      child: Text(
                        "lbl_9_41".tr,
                        style: CustomTextStyles.titleMediumSFProTextBlack900,))),
          Align(
              alignment: Alignment.centerRight,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgSettings,
                        height: 12.v,
                        width: 18.h,
                        margin: EdgeInsets.only(top: 1.v)),
                    CustomImageView(
                        imagePath: ImageConstant.imgSettingsBlack900,
                        height: 11.v,
                        width: 17.h,
                        margin: EdgeInsets.only(left: 8.h, top: 1.v)),
                    Padding(
                        padding: EdgeInsets.only(left: 7.h),
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
                            margin: EdgeInsets.only(
                                left: 1.h, top: 5.v, bottom: 3.v)))
                  ])),
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 36.v,
                  width: 122.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 19.h, vertical: 12.v),
                  decoration: AppDecoration.fillBlack
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder18),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLock,
                      height: 11.adaptSize,
                      width: 11.adaptSize,
                      alignment: Alignment.topRight))),
          Align(
              alignment: Alignment.center,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 19.h, vertical: 12.v),
                    decoration: AppDecoration.fillBlack.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder18),
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
                    margin:
                        EdgeInsets.only(left: 8.h, top: 12.v, bottom: 12.v)),
                Padding(
                    padding:
                        EdgeInsets.only(left: 7.h, top: 11.v, bottom: 12.v),
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
                        margin: EdgeInsets.only(
                            left: 1.h, top: 16.v, bottom: 15.v)))
              ]))
        ]));
  }

  Widget _buildAllComponent(BuildContext context) {
    return Expanded(
      child: BlocSelector<BLOC.SearchBloc, BLOC.SearchState, MODL.SearchModel?>(
        selector: (state) => state.searchModelObj,
        builder: (context, MODL.SearchModel? searchModelObj) {
          List<AllcomponentItemModel> podcastList =
          (searchModelObj?.podcastList ?? []).map((item) => AllcomponentItemModel.fromPodcastMap(item)).toList();

          return ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: podcastList.length,
            itemBuilder: (context, index) {
              AllcomponentItemModel model = podcastList[index];
              return AllcomponentItemWidget(
                model,
                onTapImgKotlinIconsImage: () {
                  onTapImgKotlinIconsImage(context);
                },
                onTapImgKotlinIconsImage1: () {
                  onTapImgKotlinIconsImage1(context);
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSeventeen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.h, right: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 43.adaptSize,
            width: 43.adaptSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.imgImage6),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onTapImageFive(context);
            },
            child: Container(
              height: 43.adaptSize,
              width: 43.adaptSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.imgImage543x43),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTapImgKotlinIconsImage(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.bookmarksScreen);
  }

  onTapImgKotlinIconsImage1(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.commentsScreen);
  }

  onTapImageFive(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.bookmarksScreen,
    );
  }
}