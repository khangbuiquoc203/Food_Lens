import 'package:flutter/material.dart';
import '../../core/app_export.dart'; 
// ignore_for_file: must_be_immutable


class AppbarTrailingCircleimage extends StatelessWidget {
  AppbarTrailingCircleimage({Key? key, this.imagePath, this.margin, this.onTap})
      : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusStyle.circleBorder15,
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath!,
          height: 30.v,
          width: 31.h,
          fit: BoxFit.contain,
          radius: BorderRadius.circular(
            15.h,
          ),
        ),
      ),
    );
  }
}
