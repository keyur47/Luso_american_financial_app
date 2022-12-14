import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luso_american_financial/utils/app_colors.dart';
import 'package:luso_american_financial/utils/size_utils.dart';

class CustomTextField extends StatelessWidget {
  final bool readOnly;
  final bool? showCursor;
  final FontWeight? fontWeight;
  final TextEditingController? controller;
  final int maxLine;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final Color? textColor;
  final double? fontSize;
  final int? maxLength;
  final double? radius;
  final bool enabled;
  final bool isPassword;
  final FocusNode? focusNode;
  final String? hintText;
  final Color? hintTextColor;
  final double? hintFontSize;
  final FontWeight? hintTextWeight;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;
  final VoidCallback? onTap;
  final Color? enableColor;
  final Color? disabledColor;
  final Color? focusedColor;
  final Color? cursorColor;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixWidget;
  final TextCapitalization? textCapitalization;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final bool isPrefixIcon;

  CustomTextField({
    Key? key,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.isPrefixIcon = false,
    this.fontWeight,
    this.showCursor,
    this.onChanged,
    this.maxLine = 1,
    this.maxLength,
    this.radius,
    this.fontSize,
    this.fillColor,
    this.textColor,
    this.disabledColor,
    this.isPassword = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.hintText,
    this.hintTextColor,
    this.hintFontSize,
    this.hintTextWeight,
    this.textAlign,
    this.textAlignVertical,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.enableColor,
    this.focusedColor,
    this.cursorColor,
    this.controller,
    this.contentPadding,
    this.prefixWidget,
    this.readOnly = false,
    this.textCapitalization,
    this.textInputAction,
    this.validator,
  }) : super(key: key);

  final ValueNotifier<bool> _isObscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isObscure,
      builder: (context, bool isObscure, _) {
        if (!isPassword) {
          isObscure = false;
        }
        return TextFormField(
          onFieldSubmitted: onFieldSubmitted,
          showCursor: showCursor ?? true,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          readOnly: readOnly,
          style: TextStyle(
            color: textColor ?? AppColors.grey,
            fontSize: fontSize ?? SizeUtils.fSize_13(),
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
          onTap: onTap,
          obscureText: isObscure,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          obscuringCharacter: '*',
          onChanged: onChanged,
          controller: controller,
          maxLines: maxLine,
          maxLength: maxLength,
          keyboardType: keyboardType,
          focusNode: focusNode,
          textAlignVertical: textAlignVertical,
          cursorColor: cursorColor ?? AppColors.black,
          textAlign: textAlign ?? TextAlign.start,
          enabled: enabled,
          validator: validator,
          decoration: InputDecoration(
            prefixIcon: prefixIcon == null && isPrefixIcon
                ? IconButton(
                    icon: Icon(
                      /**/
                      Icons.search,
                      color: Colors.grey,
                      size: SizeUtils.verticalBlockSize * 2.6,
                    ),
                    onPressed: () {},
                  )
                : prefixIcon,
            errorMaxLines: 2,
            prefix: prefixWidget,
            contentPadding: contentPadding,
            isDense: true,
            suffixIcon: suffixIcon == null && isPassword
                ? IconButton(
                    icon: Icon(
                      isObscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _isObscure.value = !isObscure;
                    },
                  )
                : suffixIcon,
            counterText: "",
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintTextColor ?? AppColors.black,
              fontSize: hintFontSize ?? SizeUtils.fSize_14(),
              fontWeight: hintTextWeight ?? FontWeight.w400,
            ),
            filled: true,
            fillColor: fillColor ?? AppColors.white,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 8),
              ),
              borderSide: BorderSide(
                color: disabledColor ?? AppColors.darkBlue.withOpacity(0.3),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 10),
              ),
              borderSide: BorderSide(
                color: enableColor ?? AppColors.darkBlue.withOpacity(0.3),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 10),
              ),
              borderSide: BorderSide(
                color: focusedColor ??AppColors.darkBlue.withOpacity(0.3),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 10),
              ),
              borderSide: BorderSide(
                color: focusedColor ??AppColors.darkBlue.withOpacity(0.3),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 10),
              ),
              borderSide: const BorderSide(color: AppColors.red),
            ),
          ),
        );
      },
    );
  }
}
