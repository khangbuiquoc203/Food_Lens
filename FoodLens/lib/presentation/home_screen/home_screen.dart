import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/app_export.dart';
import 'bloc/home_bloc.dart';
import 'models/home_model.dart';
import 'models/userprofile_item_model.dart';
import 'widgets/userprofile_item_widget.dart';
import '../camera_screen/views/camera_view.dart' as cam;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(HomeState(
        homeModelObj: HomeModel(),
      ))
        ..add(HomeInitialEvent()),
      child: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.97,
              width: SizeUtils.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 750,
                      margin: EdgeInsets.only(bottom: 10.v),
                      decoration: AppDecoration.fillGreenA,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildStackrewind(context),
                          SizedBox(height: 20.v),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 40.h),
                              child: Text(
                                "lbl_activity".tr,
                                style: CustomTextStyles.headlineLargeGreen900,
                              ),
                            ),
                          ),
                          SizedBox(height: 17.v),
                          SizedBox(
                            height: 106.v,
                            width: 274.h,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Opacity(
                                  opacity: 0.6,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 57.v,
                                      width: 237.h,
                                      decoration: BoxDecoration(
                                        color:
                                            appTheme.black900.withOpacity(0.56),
                                        borderRadius: BorderRadius.circular(
                                          20.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgATableOfFruit,
                                  height: 91.v,
                                  width: 270.h,
                                  radius: BorderRadius.circular(
                                    20.h,
                                  ),
                                  alignment: Alignment.topCenter,
                                ),
                                // Align(
                                //   alignment: Alignment.topCenter,
                                //   child: Container(
                                //     margin: EdgeInsets.only(top: 20.v),
                                //     decoration: AppDecoration.outlineBlack9002,
                                //     child: Text(
                                //       "lbl_food_suggestion".tr,
                                //       style: theme.textTheme.headlineLarge,
                                //     ),
                                //   ),
                                // )
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Navigate to the CameraScreen when text is tapped
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                cam.CameraView()),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 20.v),
                                      decoration:
                                          AppDecoration.outlineBlack9002,
                                      child: Text(
                                        "lbl_food_suggestion".tr,
                                        style: theme.textTheme.headlineLarge,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 17.v)
                        ],
                      ),
                    ),
                  ),
                  _buildStackviewone(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackrewind(BuildContext context) {
    return SizedBox(
      height: 240.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return CarouselSlider.builder(
                options: CarouselOptions(
                  height: 240.v,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    state.sliderIndex = index;
                  },
                ),
                itemCount: state.homeModelObj?.userprofileItemList.length ?? 0,
                itemBuilder: (context, index, realIndex) {
                  UserprofileItemModel model =
                      state.homeModelObj?.userprofileItemList[index] ??
                          UserprofileItemModel();
                  return UserprofileItemWidget(
                    model,
                  );
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Container(
                  height: 12.v,
                  margin: EdgeInsets.only(bottom: 50.v),
                  child: AnimatedSmoothIndicator(
                    activeIndex: state.sliderIndex,
                    count: state.homeModelObj?.userprofileItemList.length ?? 0,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                      spacing: 8,
                      activeDotColor: appTheme.whiteA700,
                      dotHeight: 12.v,
                      dotWidth: 12.h,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStackviewone(BuildContext context) {
    return Align(
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
              alignment: Alignment.topLeft,
              child: Container(
                height: 56.adaptSize,
                width: 56.adaptSize,
                margin: EdgeInsets.only(left: 72.v),
                decoration: BoxDecoration(
                  color: appTheme.lightGreenA700,
                  borderRadius: BorderRadius.circular(
                    28.h,
                  ),
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 28.v,
              width: 28.h,
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(
                left: 75.h,
                bottom: 40.v,
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
              onTap: () => onTapBtnProfile(context),
              imagePath: ImageConstant.imgAccountCircleGray500,
              height: 28.h,
              width: 28.v,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(
                right: 76.h,
                bottom: 26.v,
              ),
            )
          ],
        ),
      ),
    );
  }

  onTapBtnFavorite(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.favoriteScreen);
  }

  onTapBtnProfile(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.profileScreen);
  }
}
