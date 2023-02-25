import 'package:flutter/material.dart';
import '../core/config/app_constants.dart';
import '../core/config/colors.dart';
import 'gradient_text.dart';

class SaveCancelButton extends StatelessWidget {
  const SaveCancelButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });

  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: switchbuttonHeight,
      width: MediaQuery.of(context).size.width/2 - 40,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: isSelected ? Colors.transparent:AppColors.kSecondaryColor,
            width: 1,
          ),
          gradient: LinearGradient(
            begin: Alignment(-0.95, 0.0),
            end: Alignment(1.0, 0.0),
            colors: isSelected ?  [Color(0xFFFF9662), Color(0xFFFF5400)] : [Colors.transparent,Colors.transparent],
            stops: [0.0, 1.0],
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          onPressed: onTap,
          child: isSelected ? Text(
            title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: isSelected ? AppColors.white : AppColors.tabUnselectTextColor,
            ),
          ):GradientText(
            title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            gradient: LinearGradient(colors: [
              Color(0xFFFF9662), Color(0xFFFF5400)
            ]),
          ),
        ),
      ),
    );
  }
}
