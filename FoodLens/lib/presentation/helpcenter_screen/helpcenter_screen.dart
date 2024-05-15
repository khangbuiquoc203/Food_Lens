import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';
import 'bloc/helpcenter_bloc.dart';
import 'models/helpcenter_model.dart';

class HelpcenterScreen extends StatelessWidget {
  const HelpcenterScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HelpcenterBloc>(
      create: (context) => HelpcenterBloc(HelpcenterState(
        helpcenterModelObj: HelpcenterModel(),
      ))
        ..add(HelpcenterInitialEvent()),
      child: HelpcenterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 10.h,
            vertical: 15.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 4.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 14.h,
                  right: 15.h,
                ),
                child: BlocSelector<HelpcenterBloc, HelpcenterState,
                    TextEditingController?>(
                  selector: (state) => state.messengertqklenController,
                  builder: (context, messengertqklenController) {
                    return CustomTextFormField(
                      controller: messengertqklenController,
                      hintText: "msg_messenger_tqk_lens".tr,
                      textInputAction: TextInputAction.done,
                      alignment: Alignment.center,
                      maxLines: 9,
                    );
                  },
                ),
              ),
              SizedBox(height: 9.v),
              Container(
                margin: EdgeInsets.only(right: 15.h),
                decoration: AppDecoration.outlineBlack9999.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgSave,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(bottom: 1.v),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.v,
                        right: 7.h,
                        bottom: 3.v,
                      ),
                      child: Text(
                        "lbl_send".tr,
                        style: CustomTextStyles.labelLargeInterWhiteA700,
                      ),
                    )
                  ],
                ),
              ),
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
                        text: "msg_tqk_lens_app_user2".tr,
                        style:
                            CustomTextStyles.titleSmallRoundedMplus1cBlack900,
                      ),
                      TextSpan(
                        text: "\n".tr,
                        style: CustomTextStyles
                            .titleSmallRoundedMplus1cBlack900Medium,
                      ),
                      TextSpan(
                        text: "msg_main_features_ingredient".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: "\n".tr,
                        style: CustomTextStyles.labelLargeRoundedMplus1cBold,
                      ),
                      TextSpan(
                        text: "msg_frequently_asked".tr,
                        style:
                            CustomTextStyles.titleSmallRoundedMplus1cBlack900,
                      ),
                      TextSpan(
                        text: "msg_how_do_i_register".tr,
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
        text: "lbl_help_center".tr,
      ),
      styleType: Style.bgOutline,
    );
  }

  /// Navigates to the previous screen.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }
}
