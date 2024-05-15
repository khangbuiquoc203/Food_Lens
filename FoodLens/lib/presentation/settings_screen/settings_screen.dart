import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/settings_bloc.dart';
import 'models/settings_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(SettingsState(
        settingsModelObj: SettingsModel(),
      ))
        ..add(SettingsInitialEvent()),
      child: SettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 2.v),
            child: Container(
              margin: EdgeInsets.only(bottom: 5.v),
              decoration: AppDecoration.fillGray,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.v),
                  _buildRowAppInformation(
                    context,
                    text: "lbl_notification".tr,
                  ),
                  SizedBox(height: 2.v),
                  _buildRowAppInformation(
                    context,
                    text: "lbl_app_information".tr,
                    onTapRowAppInformation: () {
                      onTapRowAppInformation(context);
                    },
                  ),
                  SizedBox(height: 2.v),
                  _buildRowAppInformation(
                    context,
                    text: "msg_terms_of_service".tr,
                    onTapRowAppInformation: () {
                      onTapRowTermOfServices(context);
                    }
                  ),
                  SizedBox(height: 565.v),
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
        ),
      ),
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
      title: AppbarTitle(
        text: "lbl_settings".tr,
        margin: EdgeInsets.only(left: 17.h),
      ),
      styleType: Style.bgFill,
    );
  }

  // /// Section Widget
  // Widget _buildRowTheme(BuildContext context) {
  //   return Container(
  //     width: double.maxFinite,
  //     padding: EdgeInsets.symmetric(
  //       horizontal: 16.h,
  //       vertical: 7.v,
  //     ),
  //     decoration: AppDecoration.fillWhiteA.copyWith(
  //       borderRadius: BorderRadiusStyle.roundedBorder10,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(bottom: 1.v),
  //           child: Text(
  //             "lbl_theme".tr,
  //             style: theme.textTheme.bodyMedium,
  //           ),
  //         ),
  //         BlocSelector<SettingsBloc, SettingsState, bool?>(
  //           selector: (state) => state.isSelectedSwitch,
  //           builder: (context, isSelectedSwitch) {
  //             return CustomSwitch(
  //               margin: EdgeInsets.only(
  //                 top: 3.v,
  //                 bottom: 4.v,
  //               ),
  //               value: isSelectedSwitch,
  //               onChange: (value) {
  //                 context
  //                     .read<SettingsBloc>()
  //                     .add(ChangeSwitchEvent(value: value));
  //               },
  //             );
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }

  /// Common widget
  Widget _buildRowAppInformation(
    BuildContext context, {
    required String text,
    Function? onTapRowAppInformation,
  }) {
    return GestureDetector(
      onTap: () {
        onTapRowAppInformation?.call();
      },
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 4.h,
                top: 1.v,
              ),
              child: Text(
                text,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: appTheme.gray700,
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 16.v,
              width: 18.h,
              margin: EdgeInsets.only(top: 1.v),
            )
          ],
        ),
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the appinformationScreen when the action is triggered.
  onTapRowAppInformation(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.appinformationScreen,
    );
  }

  onTapRowTermOfServices(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.termOfServicesScreen,
    );
  }
}
