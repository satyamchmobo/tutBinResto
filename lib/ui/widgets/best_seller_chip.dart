import 'package:flutter/material.dart';
import 'package:tutorbin/ui/widgets/text.dart';
import 'package:tutorbin/utils/constants/app_colors.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(48)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),

        //Wrap your widget with the Transform widget

        child: text(
            color: AppColors.primaryWhite, text: 'Best Seller', fontSize: 8),
      ),
    );
  }
}
