import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/checkphone_bloc.dart';
import 'models/checkphone_model.dart';

class CheckphoneScreen extends StatelessWidget {
  const CheckphoneScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<CheckphoneBloc>(
      create: (context) => CheckphoneBloc(CheckphoneState(
        checkphoneModelObj: CheckphoneModel(),
      ))
        ..add(CheckphoneInitialEvent()),
      child: CheckphoneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckphoneBloc, CheckphoneState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray300,
            appBar: _buildAppbar(context),
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 12.v),
              child: Column(
                children: [
                  Container(
                    width: 308.h,
                    margin: EdgeInsets.only(
                      left: 18.h,
                      right: 33.h,
                    ),
                    child: Text(
                      "msg_please_enter_the".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumErrorContainer,
                    ),
                  ),
                  SizedBox(height: 9.v),
                  _buildRowzipcode(context),
                  SizedBox(height: 15.v),
                  CustomElevatedButton(
                    text: "lbl_confirm".tr,
                    margin: EdgeInsets.only(
                      left: 15.h,
                      right: 16.h,
                    ),
                    buttonTextStyle: theme.textTheme.titleMedium!,
                  ),
                  SizedBox(height: 5.v)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
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
        text: "lbl_check_phone".tr,
        margin: EdgeInsets.only(left: 12.h),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildRowzipcode(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 9.h,
              top: 2.v,
              bottom: 1.v,
            ),
            child: Text(
              "lbl_339138".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              "lbl_send_again".tr,
              style: CustomTextStyles.bodyMediumPrimaryContainer,
            ),
          )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
