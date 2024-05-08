import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mentalhealth_app/utils/device/device_utility.dart';

import '../../../utils/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.actions,
    this.color = MhColors.blue,
    this.leadingIcon = Icons.arrow_back_ios, this.leadingOnPressed
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData leadingIcon;
  final Color color;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => Get.back(),
                  icon: Icon(
                    leadingIcon,
                    color: color,
                  ),
                )
              : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MhDeviceUtils.getAppBarHeight());
}
