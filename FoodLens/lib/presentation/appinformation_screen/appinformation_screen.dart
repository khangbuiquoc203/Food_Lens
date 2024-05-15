import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/appinformation_bloc.dart';
import 'models/appinformation_model.dart';

class AppinformationScreen extends StatelessWidget {
  const AppinformationScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppinformationBloc>(
      create: (context) => AppinformationBloc(AppinformationState(
        appinformationModelObj: AppinformationModel(),
      ))
        ..add(AppinformationInitialEvent()),
      child: AppinformationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppinformationBloc, AppinformationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray300,
            appBar: _buildAppBar(context),
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 15.v,
              ),
              child: Column(
                children: [
                  Spacer(
                    flex: 42,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgRectangle34625187,
                    height: 160.adaptSize,
                    width: 160.adaptSize,
                  ),
                  SizedBox(height: 56.v),
                  _buildStack(context),
                  SizedBox(height: 3.v),
                  Text(
                    "lbl_version_1_0_0b".tr,
                    style: theme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 28.v),
                  Container(
                    width: 300.h,
                    margin: EdgeInsets.only(
                      left: 25.h,
                      right: 13.h,
                    ),
                    child: Text(
                      "msg_21110298_ng_kim".tr,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 6, 104, 63)
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 57,
                  ),
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
      title: AppbarTitle(
        text: "lbl_app_information".tr,
        margin: EdgeInsets.only(left: 17.h),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildStack(BuildContext context) {
    return SizedBox(
      height: 66.v,
      width: 304.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle34625165,
            height: 54.v,
            width: 158.h,
            alignment: Alignment.topRight,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle34625166,
            height: 61.v,
            width: 170.h,
            alignment: Alignment.bottomLeft,
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
