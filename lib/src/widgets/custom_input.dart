/*the following class defines the custom input field widget, 

@author yusuf umar
@since 29-11-2021
*/
import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/constants/app_color.dart';
import 'package:quiz_app/src/core/utilities/size-config.dart';

import '../core/constants/app_sizes.dart';

class CustomInput extends StatelessWidget {
  //uses to store the hint
  final String? hint;
  //uses to store the label
  final String? label;
  //uses to store the descriptio
  final String? description;
  //uses to store the type
  final String? type;
  //uses to store the width
  final double? width;
  //uses to store the prefix icon
  final Widget? prefixIcon;
  //uses to store the suffix icon
  final Widget? suffixIcon;
  //uses to store the visibility state
  final bool isSecure;
  //uses to store the visibility state
  final bool enabled;

  // final bool enabled;
  //uses to store the onSave function
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  //uses to store the validator
  final dynamic validator;
  //uses to store the max lines
  final int maxLines;
  //uses to store the text editing controller
  final TextEditingController? controller;
  var keyBoard;
  TextAlign alignText;
  final int maxLeght;

  CustomInput(
      {Key? key,
      this.hint,
      this.label,
      this.description,
      this.isSecure = false,
      this.enabled = true,
      this.onSaved,
      this.onChanged,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.type,
      this.width,
      this.maxLines = 1,
      this.controller,
      this.keyBoard,
      required this.alignText,
      this.maxLeght = 225})
      : super(key: key);

//uses to store border style
  var borderstyle = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(AppSizes.large_dimension)),
    borderSide: BorderSide(width: 1, color: AppColor.iconColor),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: SizeConfig.safeBlockHorizontal! * 3.6,
        fontWeight: FontWeight.w400,
        color: AppColor.whiteColor,
      ),

      cursorColor: AppColor.iconColor,
      obscureText: isSecure,
      enabled: enabled,
      // type:type,
      textAlign: alignText,
      keyboardType: keyBoard,
      maxLength: maxLeght,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontal_padding,
        ),
        errorMaxLines: 1,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
            color: AppColor.whiteColor,
            fontSize: SizeConfig.safeBlockHorizontal! * 4.66),
        errorBorder: borderstyle,
        counterText: '',
        labelText: label,
        labelStyle: TextStyle(
          color: AppColor.whiteColor,
        ),
        focusedErrorBorder: borderstyle,
        filled: true,
        // fillColor: AppColor.iconColor,
        focusedBorder: borderstyle,
        // border: borderstyle,

        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(AppSizes.large_dimension)),
          borderSide: BorderSide(width: 1, color: AppColor.iconColor),
        ),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(4)),
        //     borderSide: BorderSide(
        //       width: 1,
        //     )),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
