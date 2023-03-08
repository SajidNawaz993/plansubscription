import 'package:flutter/material.dart';
import 'package:plansubscription/common/vertical_space.dart';

import '../core/config/app_constants.dart';
import '../core/config/colors.dart';

class CommonTextFieldView extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final String? errorText;
  final bool isAllowTopTitleView;
  final EdgeInsetsGeometry padding;
  final Function(String)? onChanged;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final double textFieldBoxHeight;

  const CommonTextFieldView({
    Key? key,
    this.labelText,
    this.hintText = '',
    this.padding = const EdgeInsets.only(),
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isAllowTopTitleView = true,
    this.errorText,
    required this.controller,
    this.textFieldBoxHeight = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != null ? Text(labelText!,style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 16
          ),):Container(),
          const VerticalSpace(smallSpace),
          Container(
            height: textFieldBoxHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Theme(
                    data:Theme.of(context).copyWith(
                      colorScheme: ThemeData().colorScheme.copyWith(
                        primary:Colors.grey,
                      ),
                    ),
                    child:TextField(
                      controller: controller,
                      maxLines: 1,
                      onChanged: onChanged,
                      style: const TextStyle(color: AppColors.plantextBlacColor,fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 19),
                      cursorColor: AppColors.kPrimaryColor,
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                      decoration: InputDecoration(
                        hintText: hintText,
                        //contentPadding: const EdgeInsets.only(left: 10),
                        suffixIcon: suffixIcon,
                        prefixIcon: prefixIcon,
                        labelText: null,
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      keyboardType: keyboardType,
                    )
                ),
              ),
            ),
          ),
          if (errorText != null && errorText != '')
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 16, top: 4, bottom: 4),
              child: Text(
                errorText ?? "",
                style: TextStyle(
                  color: Colors.red.shade200,
                  fontSize: 14,
                ),
              ),
            )
        ],
      ),
    );
  }
}
