import 'package:flutter/material.dart';
import 'package:tutorbin/ui/widgets/text.dart';
import 'package:tutorbin/utils/constants/app_colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryOrange,
            width: 1,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(48)),
      child: Center(
        child: text(
            color: AppColors.primaryOrange,
            text: 'Add',
            fontSize: 12,
            fontWeight: FontWeight.bold),
    ),
    );
  }
}
