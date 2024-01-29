import 'package:codefusion/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomSearchView extends StatefulWidget {
  CustomSearchView({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus = true,
    this.textStyle,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled = true,
    this.validator,
    this.onChanged,
    this.onUserInput,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final double? width;

  final TextEditingController? scrollPadding;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final bool? autofocus;

  final TextStyle? textStyle;

  final TextInputType? textInputType;

  final int? maxLines;

  final String? hintText;

  final TextStyle? hintStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final Function(String)? onChanged;

  final Function(String)? onUserInput;

  // Callback function to pass user input back to the parent


  @override
  _CustomSearchViewState createState() => _CustomSearchViewState();
}

class _CustomSearchViewState extends State<CustomSearchView>{
  // Initialize the TextEditingController
  final TextEditingController _searchController = TextEditingController();

  // Method to get the user input from the controller
  String get UserInput{
    return _searchController.text;
  }
@override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: searchViewWidget(context),
          )
        : searchViewWidget(context);
  }

  Widget searchViewWidget(BuildContext context) => SizedBox(
        width: widget.width ?? double.maxFinite,
        child: TextFormField(
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          controller: widget.controller,
          focusNode: widget.focusNode ?? FocusNode(),
          autofocus: widget.autofocus!,
          style: widget.textStyle ?? CustomTextStyles.bodyMediumInterBlack90014,
          keyboardType: widget.textInputType,
          maxLines: widget.maxLines ?? 1,
          decoration: decoration,
          validator: widget.validator,
          onChanged: (String value) {
            // Check if the callback is not null before calling it
            widget.onUserInput?.call(value);
            widget.onChanged?.call(value);
          },
        ),
      );
  InputDecoration get decoration => InputDecoration(
        hintText: widget.hintText ?? "",
        hintStyle: widget.hintStyle ?? CustomTextStyles.bodyMediumInterBlack90014,
        prefixIcon: widget.prefix ??
            Container(
              margin: EdgeInsets.all(8.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgSearch,
                height: 16.adaptSize,
                width: 16.adaptSize,
              ),
            ),
        prefixIconConstraints: widget.prefixConstraints ??
            BoxConstraints(
              maxHeight: 32.v,
            ),
        suffixIcon: widget.suffix ??
            Padding(
              padding: EdgeInsets.only(
                right: 15.h,
              ),
              child: IconButton(
                onPressed: () => widget.controller!.clear(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
        suffixIconConstraints: widget.suffixConstraints ??
            BoxConstraints(
              maxHeight: 32.v,
            ),
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.only(
              top: 7.v,
              right: 7.h,
              bottom: 7.v,
            ),
        fillColor: widget.fillColor ?? appTheme.whiteA700,
        filled: widget.filled,
        border: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide.none,
            ),
        enabledBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.h),
              borderSide: BorderSide.none,
            ),
      );

  @override
  void dispose(){
    // Dispose of the TextEditingController
    _searchController.dispose();
    super.dispose();
  }
}
