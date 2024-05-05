import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mentalhealth_app/utils/device/device_utility.dart';

import '../../../utils/constants/colors.dart';

class MhAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MhAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.actions,
    this.leadingOnPressed,
    this.color = MhColors.white,
    this.leadingIcon = Iconsax.arrow_left,
    this.totalQuestions = 0,
    this.currentQuestionIndex = 0,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData leadingIcon;
  final Color color;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final int totalQuestions;
  final int currentQuestionIndex;

  @override
  Widget build(BuildContext context) {
    double progress = (currentQuestionIndex + 1) / totalQuestions;
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Iconsax.arrow_left,
                color: color,
              ),
            )
          // ignore: unnecessary_null_comparison
          : leadingIcon != null
              ? IconButton(
                  onPressed: leadingOnPressed,
                  icon: Icon(
                    leadingIcon,
                    color: color,
                  ),
                )
              : null,
      title: title,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(MhColors.orange),
            minHeight: 8,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MhDeviceUtils.getAppBarHeight());
}
