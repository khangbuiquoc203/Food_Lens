import 'package:flutter/material.dart';
import 'package:tqk_lens/core/utils/global_variables.dart';
import '../../core/app_export.dart';
import 'bloc/profile_bloc.dart';
import 'models/profile_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => ProfileBloc(ProfileState(
        profileModelObj: ProfileModel(),
      ))
        ..add(ProfileInitialEvent()),
      child: ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.97,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 800.v,
                          decoration: AppDecoration.fillGreenA,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildStack2479e1d491(context),
                              SizedBox(height: 36.v),
                              _buildColumnaccountut(context),
                              SizedBox(height: 45.v),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10.h),
                                  child: Text(
                                    "lbl_different".tr,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.v),
                              _buildStackhelpcenter(context),
                              SizedBox(height: 5.v)
                            ],
                          ),
                        ),
                      ),
                      _buildStackview(context)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildStack2479e1d491(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white, // Define a text color if needed
    );

    var textStyle1 = TextStyle(
      fontSize: 18,
      color: Colors.white, // Define a text color if needed
    );

    return SizedBox(
      height: 156.v,
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned.fill(
            child: CustomImageView(
              imagePath: ImageConstant.img2479e1d491b49f2,
              height: 156.v,
              width: 360.h,
              radius: BorderRadius.circular(0.h),
            ),
          ),
          Positioned(
            left: 16.v,
            bottom: 35.h,
            child: CustomImageView(
              imagePath: ImageConstant.img13132149334592,
              height: 80.v,
              width: 80.h,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 16.v,
            bottom: 35.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBlackBorderText("$global_username".tr, textStyle),
                SizedBox(height: 8.v),
                _buildBlackBorderText("lbl_member".tr, textStyle1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlackBorderText(String text, TextStyle style) {
    return Stack(
      children: <Widget>[
        // Texts with shadows
        Text(
          text,
          style: style.copyWith(color: Colors.black, shadows: [
            Shadow(offset: Offset(1, 1), color: Colors.black),
            Shadow(offset: Offset(-1, 1), color: Colors.black),
            Shadow(offset: Offset(1, -1), color: Colors.black),
            Shadow(offset: Offset(-1, -1), color: Colors.black),
          ]),
        ),
        // Foreground Text
        Text(
          text,
          style: style,
        ),
      ],
    );
  }


  /// Section Widget
  Widget _buildColumnaccountut(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.h),
            child: Text(
              "msg_account_utility".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 3.v),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(0),
            color: appTheme.whiteA700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Container(
              width: 600.h,
              margin: EdgeInsets.only(right: 0.h),
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 14.v,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 3.v,
                  ),
                  InkWell(
                    onTap: () => onTapBtnAccount(context),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConstant
                              .imngContactMail, // Correct path to your image
                          width: 24, // Appropriate width for your design
                          height: 24, // Appropriate height for your design
                        ),
                        SizedBox(
                            width: 10.v), // Spacing between the image and text
                        Padding(
                          padding: EdgeInsets.only(
                              right:
                                  0.v), // Set your desired padding for the text
                          child: Text(
                            "msg_account_tqk_lens".tr,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(width: 167.v),
                        Padding(
                          padding: EdgeInsets.all(
                              0), // Set your desired padding for the SVG image
                          child: SvgPicture.asset(
                            ImageConstant.imgArrowRight,
                            width: 24, // Appropriate width for your design
                            height: 24, // Appropriate height for your design
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }



  Widget _buildStackhelpcenter(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Column(
        children: [
          _buildHelpCard(
              "msg_help_center".tr, ImageConstant.imgContactSupport, context,
              () {
            // Handle tap for Help Center
            onTapBtnHelpCenter(context);
            print('Help Center tapped');
            // NavigatorService.pushNamed(AppRoutes.homeScreen);
          }),
          _buildHelpCard(
              "msg_help_settings".tr, ImageConstant.imgSettingsProfile, context,
              () {
            // Handle tap for Settings
            onTapBtnSetting(context);
            print('Settings tapped');
          }),
          _buildHelpCard("msg_help_log".tr, ImageConstant.imgLogOut, context,
              () {
            // Handle tap for Log
            onTapBtnLogOut(context);
            print('Log tapped');
          }),
        ],
      ),
    );
  }

  // Widget _buildHelpCard(String text, BuildContext context, VoidCallback onTap) {
  //   ThemeData theme =
  //       Theme.of(context); // Use ThemeData here if it's not globally accessible
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Card(
  //       clipBehavior: Clip.antiAlias,
  //       elevation: 0,
  //       margin: EdgeInsets.symmetric(vertical: 3.v, horizontal: 0.v),
  //       color: appTheme.whiteA700,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Padding(
  //         padding: EdgeInsets.only(
  //             left: 60.v, right: 240.v, top: 10.v, bottom: 10.v),
  //         child: Text(
  //           text,
  //           style: theme.textTheme
  //               .titleMedium, // Ensure this style exists in your theme
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildHelpCard(
      String text, String image, BuildContext context, VoidCallback onTap) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 3.v, horizontal: 0.v),
        color: appTheme.whiteA700,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.v, horizontal: 20.v),
          child: Row(
            children: [
              Image.asset(
                image, // Correct path to your image
                width: 24, // Appropriate width for your design
                height: 24, // Appropriate height for your design
              ),
              SizedBox(width: 10.v), // Spacing between the image and text
              Expanded(
                child: Text(
                  text,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(width: 10.v), // Adjusted spacing
              SvgPicture.asset(
                ImageConstant.imgArrowRight,
                width: 24, // Appropriate width for your design
                height: 24, // Appropriate height for your design
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackview(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 84.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 76.v,
                width: 369.h,
                decoration: BoxDecoration(
                  color: appTheme.gray900,
                  borderRadius: BorderRadius.circular(
                    0.h,
                  ),
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgSubtract,
              height: 58.v,
              width: 110.h,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 8.v),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 56.adaptSize,
                width: 56.adaptSize,
                margin: EdgeInsets.only(left: 205.v),
                decoration: BoxDecoration(
                  color: appTheme.lightGreenA700,
                  borderRadius: BorderRadius.circular(
                    28.h,
                  ),
                ),
              ),
            ),
            CustomImageView(
              onTap: () => onTapBtnHome(context),
              imagePath: ImageConstant.imgVector1,
              height: 28.v,
              width: 28.h,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(
                left: 75.h,
                bottom: 28.v,
              ),
            ),
            CustomImageView(
              onTap: () => onTapBtnFavorite(context),
              imagePath: ImageConstant.imgKidStar,
              height: 28.v,
              width: 28.h,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 26.v),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgAccountCircle,
              height: 28.h,
              width: 28.v,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(
                right: 76.h,
                bottom: 40.v,
              ),
            )
          ],
        ),
      ),
    );
  }

  onTapBtnAccount(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.accountsetupScreen);
  }

  onTapBtnHelpCenter(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.helpcenterScreen);
  }

  onTapBtnSetting(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.settingsScreen);
  }

  onTapBtnLogOut(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.loginScreen);
  }

  onTapBtnHome(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.homeScreen);
  }

  onTapBtnFavorite(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.favoriteScreen);
  }
}
