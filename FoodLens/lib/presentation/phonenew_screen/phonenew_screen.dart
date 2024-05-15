import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import 'bloc/phonenew_bloc.dart';
import 'models/phonenew_model.dart';

class PhonenewScreen extends StatelessWidget {
  const PhonenewScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<PhonenewBloc>(
      create: (context) => PhonenewBloc(PhonenewState(
        phonenewModelObj: PhonenewModel(),
      ))
        ..add(PhonenewInitialEvent()),
      child: PhonenewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhonenewBloc, PhonenewState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray300,
            appBar: _buildAppbar(context),
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 2.v),
              child: Column(
                children: [
                  _buildRowmobileno(context),
                  SizedBox(height: 9.v),
                  CustomElevatedButton(
                    text: "lbl_continue".tr,
                    margin: EdgeInsets.only(
                      left: 17.h,
                      right: 14.h,
                    ),
                    buttonTextStyle: theme.textTheme.titleMedium!,
                    onPressed: () {
                      onTapContinue(context);
                    },
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
        text: "lbl_phone_new".tr,
        margin: EdgeInsets.only(left: 12.h),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildRowmobileno(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 7.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "lbl_0968068086".tr,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgClose,
            height: 16.v,
            width: 18.h,
          )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the checkphoneScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.checkphoneScreen,
    );
  }
}
