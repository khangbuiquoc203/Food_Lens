import 'package:flutter/material.dart';
import 'package:tqk_lens/core/utils/global_variables.dart';
import '../../core/app_export.dart';
import 'bloc/favorite_bloc.dart';
import 'models/favorite_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (context) => FavoriteBloc(FavoriteState(
        favoriteModelObj: FavoriteModel(),
      ))
        ..add(FavoriteInitialEvent()),
      child: FavoriteScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    // Your header widget goes here
                    _buildStack2479e1d491(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Favorites',
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(4.0, 4.0),
                                blurRadius: 5.0,
                                color: Colors.grey.withOpacity(0.7), 
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<dynamic>>(
                        future: fetchUserFavoritesWithFoodName(global_email),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text("Error: ${snapshot.error}"));
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Center(
                              child: Align(
                                alignment: Alignment(0, -0.4),
                                child: Text(
                                  "No favorites available",
                                  style: TextStyle(
                                    fontSize: 24.0, 
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var favorite = snapshot.data![index];
                                return _buildRepeatedContainer(favorite, context);
                              },
                            );
                          }
                        },
                      ),
                    ),
                    // Positioned(
                    //   bottom: 0.v,
                    //   left: 0,
                    //   right: 0,
                    //   top: 0.v,
                    //   child: _buildStackview(context),
                    // ),
                    _buildStackview(context),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


Widget _buildRepeatedContainer(dynamic favorite, BuildContext context) {
  String foodName = favorite['foodName'];

  return InkWell(
    onTap: () => onTapBtnDetailFood(foodName, context),
    child: Container(
      height: 90.v,
      // width: 280.h,
      width: MediaQuery.of(context).size.width * 0.85,
      margin: EdgeInsets.only(bottom: 16.v, left: 15.h, right: 15.h),
      // decoration: AppDecoration.outlineBlueGray.copyWith(
      //   borderRadius: BorderRadiusStyle.roundedBorder20,
      // ),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(20.h), 
        border: Border.all(color: Colors.blueGrey, width: 1), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10.h,
            offset: Offset(0, 10.h), 
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.h),
              bottomLeft: Radius.circular(20.h),
            ),
            child: CustomImageView(
              imagePath: 'assets/imageFood/' + foodName + '.jpg',
              height: 90.v,
              width: 91.h,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    foodName,
                    style: theme.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.v),
                  Text(
                    "Click here for more detail",
                    style: TextStyle(
                      color: const Color.fromARGB(
                                255, 36, 36, 36), 
                      fontWeight: FontWeight.normal, 
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgStar,
            height: 25.adaptSize,
            width: 25.adaptSize,
            margin: EdgeInsets.only(top: 2.v, bottom: 3.v, right: 10.h),
          ),
        ],
      ),
    ),
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
            imagePath: ImageConstant.imgKidStarGray900,
            height: 28.v,
            width: 28.h,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 14.v),
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

onTapBtnHome(BuildContext context) {
  NavigatorService.pushNamed(AppRoutes.homeScreen);
}

onTapBtnProfile(BuildContext context) {
  NavigatorService.pushNamed(AppRoutes.profileScreen);
}

Future<List<dynamic>> fetchUserFavoritesWithFoodName(String email) async {
  var url = Uri.parse('$BASE_URL/get_user_favorites');
  try {
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'email': email}),
    );
    if (response.statusCode == 200) {
      List<dynamic> favorites = json.decode(response.body);
      return favorites;
    } else {
      throw Exception('Failed to load favorites');
    }
  } catch (e) {
    print(e.toString());
    return [];
  }
}

onTapBtnDetailFood(String foodName, BuildContext context) {
  if (foodName.isNotEmpty) {
    NavigatorService.pushNamed(
      AppRoutes.detailfoodScreen,
      arguments: {'foodName': foodName},
    );
  } else {
    print("No results to pass.");
  }
}
