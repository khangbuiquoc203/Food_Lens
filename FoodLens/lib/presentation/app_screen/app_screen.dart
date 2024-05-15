import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/app_bloc.dart';
import 'models/app_model.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (context) => AppBloc(AppState(
        appModelObj: AppModel(),
      ))
        ..add(AppInitialEvent()),
      child: AppScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: SizedBox(
              height: 810.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgSamsungGalaxyA14,
                    height: 800.v,
                    width: 360.h,
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 8.v),
                      child: Container(
                        height: 560.v,
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 23.h,
                                  right: 43.h,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.h,
                                  vertical: 6.v,
                                ),
                                decoration:
                                    AppDecoration.outlineBlackF.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder30,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: 27.v),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgRectangle4,
                                      height: 150.adaptSize,
                                      width: 150.adaptSize,
                                      radius: BorderRadius.circular(
                                        37.h,
                                      ),
                                      onTap: () {
                                        onTapImgImage(context);
                                      },
                                    ),
                                    SizedBox(height: 23.v),
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgRectangle346251667,
                                      height: 49.v,
                                      width: 254.h,
                                    ),
                                    SizedBox(height: 24.v),
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgWelcomeBannerWith,
                                      height: 81.v,
                                      width: 228.h,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "lbl_version_1_0_0b".tr,
                                style: theme.textTheme.titleSmall,
                              ),
                            )
                          ],
                        ),
                      ),
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

  /// Navigates to the loginScreen when the action is triggered.
  onTapImgImage(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
