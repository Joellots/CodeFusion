import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:codefusion/core/app_export.dart';
import 'package:codefusion/core/utils/validation_functions.dart';
import 'package:codefusion/widgets/custom_elevated_button.dart';
import 'package:codefusion/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            decoration: AppDecoration.fillBlueGray,
                            child: Column(children: [
                              SizedBox(height: 177.v),
                              _buildSignInForm(context)
                            ])))))));
  }

  /// Section Widget
  Widget _buildSignInForm(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 30.h, right: 34.h),
        child: Column(children: [
          Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: appTheme.whiteA700,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Container(
                  height: 71.v,
                  width: 366.h,
                  decoration: AppDecoration.fillWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Stack(alignment: Alignment.center, children: [
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 10.h, right: 32.h, bottom: 20.v),
                            padding: EdgeInsets.symmetric(horizontal: 8.h),
                            decoration: AppDecoration.fillGray.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder4),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 1.v),
                                  Text("lbl_username".tr,
                                      style: theme.textTheme.titleLarge)
                                ]))),
                    Align(
                        alignment: Alignment.center,
                        child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusStyle.roundedBorder10),
                            child: Container(
                                height: 71.v,
                                width: 366.h,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10),
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 10.h,
                                                  right: 32.h,
                                                  bottom: 20.v),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 8.h),
                                              decoration: AppDecoration.fillGray
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder4),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(height: 1.v),
                                                    Text("lbl_username".tr,
                                                        style: theme.textTheme
                                                            .titleLarge)
                                                  ]))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Card(
                                              clipBehavior: Clip.antiAlias,
                                              elevation: 0,
                                              margin: EdgeInsets.all(0),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder10),
                                              child: Container(
                                                  height: 71.v,
                                                  width: 366.h,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder10),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                                margin: EdgeInsets.only(
                                                                    left: 10.h,
                                                                    right: 32.h,
                                                                    bottom:
                                                                        20.v),
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        8.h),
                                                                decoration: AppDecoration
                                                                    .fillGray
                                                                    .copyWith(
                                                                        borderRadius:
                                                                            BorderRadiusStyle
                                                                                .roundedBorder4),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SizedBox(
                                                                          height:
                                                                              1.v),
                                                                      Text(
                                                                          "lbl_username"
                                                                              .tr,
                                                                          style: theme
                                                                              .textTheme
                                                                              .titleLarge)
                                                                    ]))),
                                                        BlocSelector<
                                                                LoginBloc,
                                                                LoginState,
                                                                TextEditingController?>(
                                                            selector: (state) =>
                                                                state
                                                                    .userNameController,
                                                            builder: (context,
                                                                userNameController) {
                                                              return CustomTextFormField(
                                                                  width: 366.h,
                                                                  controller:
                                                                      userNameController,
                                                                  hintText:
                                                                      "lbl_username"
                                                                          .tr,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  validator:
                                                                      (value) {
                                                                    if (!isText(
                                                                        value)) {
                                                                      return "err_msg_please_enter_valid_text"
                                                                          .tr;
                                                                    }
                                                                    return null;
                                                                  });
                                                            })
                                                      ]))))
                                    ]))))
                  ]))),
          SizedBox(height: 24.v),
          BlocSelector<LoginBloc, LoginState, TextEditingController?>(
              selector: (state) => state.passwordController,
              builder: (context, passwordController) {
                return CustomTextFormField(
                    controller: passwordController,
                    hintText: "lbl_password".tr,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null ||
                          (!isValidPassword(value, isRequired: true))) {
                        return "err_msg_please_enter_valid_password".tr;
                      }
                      return null;
                    },
                    obscureText: true);
              }),
          SizedBox(height: 142.v),
          CustomElevatedButton(
              width: 173.h,
              text: "lbl_sign_in".tr,
              onPressed: () {
                onTapSignIn(context);
              })
        ]));
  }

  /// Navigates to the searchScreen when the action is triggered.
  onTapSignIn(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.searchScreen,
    );
  }
}
