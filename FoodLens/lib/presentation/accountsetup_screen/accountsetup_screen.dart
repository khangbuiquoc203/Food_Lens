import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/global_variables.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/appbar_trailing_circleimage.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/accountsetup_bloc.dart';
import 'models/accountsetup_model.dart';

class AccountsetupScreen extends StatelessWidget {
  const AccountsetupScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AccountsetupBloc>(
      create: (context) => AccountsetupBloc(AccountsetupState(
        accountsetupModelObj: AccountsetupModel(),
      ))
        ..add(AccountsetupInitialEvent()),
      child: AccountsetupScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsetupBloc, AccountsetupState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray300,
            appBar: _buildAppBar(context),
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 2.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRowSocialMedia(
                    context,
                    text: "lbl_username".tr,
                    text1: global_username,
                    onTap: () {
                      onTapUsername(context);
                    },
                  ),
                  SizedBox(height: 2.v),
                  _buildRowResetPassword(context),
                  Spacer(),
                  SizedBox(height: 13.v),
                  Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text(
                      "lbl_version_1_0_0b".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 55.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 15.v,
          bottom: 10.v,
        ),
        onTap: () {
          onTapArrowleftone(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_account_setup".tr,
      ),
      actions: [
        AppbarTrailingCircleimage(
          imagePath: ImageConstant.img13132149334592,
          margin: EdgeInsets.fromLTRB(13.h, 17.v, 24.h, 13.v),
        )
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildRowUsername(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapUsername(context);
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 5.v,
        ),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                top: 2.v,
                bottom: 3.v,
              ),
              child: Text(
                "lbl_username".tr,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            Container(
              height: 18.v,
              width: 166.h,
              margin: EdgeInsets.only(top: 2.v),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "lbl_taylorswift".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    height: 16.v,
                    width: 18.h,
                    alignment: Alignment.topRight,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowResetPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapChangePassword(context);
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 4.v,
        ),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                top: 3.v,
                bottom: 4.v,
              ),
              child: Text(
                "lbl_change_pasword".tr,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 16.v,
              width: 18.h,
              margin: EdgeInsets.only(bottom: 8.v),
            )
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildRowSocialMedia(
    BuildContext context, {
    required String text,
    required String text1,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 14.h,
          vertical: 7.v,
        ),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                bottom: 1.v,
              ),
              child: Text(
                text,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: appTheme.gray700,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Text(
                text1,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: appTheme.gray700,
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 16.v,
              width: 18.h,
              margin: EdgeInsets.only(bottom: 1.v),
            )
          ],
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.profileScreen);
  }

  /// Navigates to the username screen.
  onTapUsername(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.usernamenewScreen);
  }

  /// Navigates to the reset password screen.
  onTapChangePassword(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.changePasswordScreen);
  }
}
