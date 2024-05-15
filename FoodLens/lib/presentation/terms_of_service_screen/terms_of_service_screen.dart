import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/terms_of_service_bloc.dart';
import 'models/terms_of_service_model.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<TermsOfServiceBloc>(
      create: (context) => TermsOfServiceBloc(TermsOfServiceState(
        termsOfServiceModelObj: TermsOfServiceModel(),
      ))
        ..add(TermsOfServiceInitialEvent()),
      child: TermsOfServiceScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 15.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 8.v),
                Container(
                  width: 303.h,
                  margin: EdgeInsets.only(
                    left: 28.h,
                    right: 8.h,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "msg_terms_of_use".tr,
                          style:
                              CustomTextStyles.titleSmallRoundedMplus1cBlack900,
                        ),
                        TextSpan(
                          text: "\n".tr,
                          style: CustomTextStyles
                              .titleSmallRoundedMplus1cBlack900Medium,
                        ),
                        TextSpan(
                          text: "msg_terms_mo".tr,
                          style: theme.textTheme.labelLarge,
                        ),
                        TextSpan(
                          text: "\n".tr,
                          style: CustomTextStyles.labelLargeRoundedMplus1cBold,
                        ),
                        TextSpan(
                          text: "msg_mot".tr,
                          style:
                              CustomTextStyles.titleSmallRoundedMplus1cBlack900,
                        ),
                        TextSpan(
                          text: "msg_mot_mot".tr,
                          style: theme.textTheme.labelLarge,
                        ),
                        TextSpan(
                          text: "msg_hai".tr,
                          style:
                              CustomTextStyles.titleSmallRoundedMplus1cBlack900,
                        ),
                        TextSpan(
                          text: "msg_hai_mot".tr,
                          style: theme.textTheme.labelLarge,
                        ),
                        TextSpan(
                          text: "msg_ba".tr,
                          style:
                              CustomTextStyles.titleSmallRoundedMplus1cBlack900,
                        ),
                        TextSpan(
                          text: "msg_ba_mot".tr,
                          style: theme.textTheme.labelLarge,
                        ),
                        TextSpan(
                          text: "msg_bon".tr,
                          style:
                              CustomTextStyles.titleSmallRoundedMplus1cBlack900,
                        ),
                        TextSpan(
                          text: "msg_bon_mot".tr,
                          style: theme.textTheme.labelLarge,
                        ),
                        TextSpan(
                          text: "msg_nam".tr,
                          style:
                              CustomTextStyles.titleSmallRoundedMplus1cBlack900,
                        ),
                        TextSpan(
                          text: "msg_nam_mot".tr,
                          style: theme.textTheme.labelLarge,
                        ),
                        TextSpan(
                          text: "lbl_tqk_lens".tr,
                          style:
                              CustomTextStyles.titleSmallRoundedMplus1cBlack900,
                        ),
                        TextSpan(
                          text: "msg_to_register".tr,
                          style: theme.textTheme.labelLarge,
                        )
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 20.v),
                Align(
                  alignment: Alignment.centerLeft,
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
        text: "lbl_terms_of_service".tr,
      ),
      styleType: Style.bgOutline,
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
