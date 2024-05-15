import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/socialmediaaccountnew_bloc.dart';
import 'models/socialmediaaccountnew_model.dart';

class SocialmediaaccountnewScreen extends StatelessWidget {
  const SocialmediaaccountnewScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SocialmediaaccountnewBloc>(
      create: (context) => SocialmediaaccountnewBloc(SocialmediaaccountnewState(
        socialmediaaccountnewModelObj: SocialmediaaccountnewModel(),
      ))
        ..add(SocialmediaaccountnewInitialEvent()),
      child: SocialmediaaccountnewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialmediaaccountnewBloc, SocialmediaaccountnewState>(
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
                  _buildRowgoogle(
                    context,
                    google: "lbl_facebook".tr,
                    connect: "lbl_disconnect".tr,
                  ),
                  SizedBox(height: 2.v),
                  _buildRowgoogle(
                    context,
                    google: "lbl_google".tr,
                    connect: "lbl_connect".tr,
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
      title: AppbarSubtitle(
        text: "msg_social_media_account".tr,
        margin: EdgeInsets.only(left: 12.h),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Common widget
  Widget _buildRowgoogle(
    BuildContext context, {
    required String google,
    required String connect,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 29.h,
        vertical: 6.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 8.h,
              top: 3.v,
            ),
            child: Text(
              google,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: appTheme.black900,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
              connect,
              style: CustomTextStyles.bodyMediumPrimaryContainer.copyWith(
                color: theme.colorScheme.primaryContainer,
              ),
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
