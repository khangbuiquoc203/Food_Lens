import 'package:flutter/material.dart';
import 'package:tqk_lens/core/utils/global_variables.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_floating_button.dart';
import 'bloc/detailingredient_bloc.dart';
import 'models/detailingredient_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../camera_screen/views/camera_view.dart' as cam;

class DetailingredientScreen extends StatelessWidget {
  final String? tag;

  const DetailingredientScreen({Key? key, required this.tag}) : super(key: key);

  static Widget builder(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic> ??
            {};
    final String tag = args['tag'] as String? ?? '';

    return BlocProvider<DetailingredientBloc>(
      create: (context) => DetailingredientBloc(DetailingredientState(
        detailingredientModelObj: DetailingredientModel(),
      ))
        ..add(DetailingredientInitialEvent()),
      child: DetailingredientScreen(tag: tag),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<String> fetchIngredientDescription(String ingredientName) async {
      var url = Uri.parse(
          '$BASE_URL/ingredient/description?nameIngredient=$ingredientName');
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          var jsonData = json.decode(response.body);
          if (jsonData['descIngredient'] != null) {
            print("desc ne: ${jsonData['descIngredient']}");
            return jsonData['descIngredient'];
          } else {
            return "No description available";
          }
        } else if (response.statusCode == 404) {
          return "No description available";
        } else {
          print(
              'Error fetching ingredient description: Server Error ${response.statusCode}');
          return "Error retrieving data";
        }
      } catch (e) {
        print('Error fetching ingredient description: $e');
        return "Error retrieving data";
      }
    }

    Future<List<String>> fetchFoodNames(String ingredientName) async {
      var url =
          Uri.parse('$BASE_URL/food/names?nameIngredient=$ingredientName');
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          List<dynamic> jsonData = json.decode(response.body)['foodNames'];
          return jsonData.map((name) => name.toString()).toList();
        } else if (response.statusCode == 404) {
          return ["No foods found"];
        } else {
          print(
              'Error fetching food names: Server Error ${response.statusCode}');
          return ["Error retrieving data"];
        }
      } catch (e) {
        print('Error fetching food names: $e');
        return ["Error retrieving data"];
      }
    }

    return BlocBuilder<DetailingredientBloc, DetailingredientState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: SizedBox(
              width: double.maxFinite,
              child: Container(
                margin: EdgeInsets.only(),
                decoration: AppDecoration.fillBlack,
                child: Column(
                  children: [
                    _buildStackSection(context),
                    SizedBox(height: 10.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.h),
                        child: Text(
                          'Information',
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 0, 255, 38), 
                            fontWeight: FontWeight.bold, 
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.1.v),
                    Container(
                      width: 293.h,
                      margin: EdgeInsets.only(
                        left: 34.h,
                        right: 24.h,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "          ".tr,
                            ),
                            WidgetSpan(
                              child: FutureBuilder<String>(
                                future: fetchIngredientDescription(tag!),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text('Loading...',
                                        style:
                                            CustomTextStyles.labelLargeGray500);
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}',
                                        style:
                                            CustomTextStyles.labelLargeGray500);
                                  } else {
                                    return Text(
                                      snapshot.data!,
                                      style: TextStyle(
                                        color: Colors
                                            .white, 
                                        fontWeight: FontWeight
                                            .bold, 
                                        fontSize: 15,
                                      ),
                                    );
                                    // Hiển thị mô tả nguyên liệu
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    FutureBuilder<List<String>>(
                      future: fetchFoodNames(tag!),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<String>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.data!.isEmpty) {
                          return Text("No foods found");
                        } else {
                          return Expanded(
                            // Bao bọc ListView.builder bằng widget Expanded
                            child: ListView.builder(
                              itemCount: snapshot.data!
                                  .length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(height: 25.v),
                                    _buildRepeatedContainer(
                                        snapshot.data![index], index, context),
                                  ],
                                );
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: _buildFloatingActionButton(context),
          ),
        );
      },
    );
  }

  Widget _buildRepeatedContainer(
      String foodName, int index, BuildContext context) {
    return InkWell(
      onTap: () => onTapBtnDetailFood(foodName, context),
      child: Column(
        children: [
          Container(
            height: 90.v,
            width: 300.h,
            decoration: AppDecoration.outlineBlueGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(20.h), 
                    border: Border.all(
                      color: Colors.white, 
                      width: 10.0, 
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: 'assets/imageFood/' +
                      (foodName.tr ?? 'Apple and walnut salad') +
                      '.jpg',
                  height: 90.v,
                  width: 91.h,
                  radius: BorderRadius.horizontal(
                    left: Radius.circular(20.h),
                  ),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 200.h),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 100.h,
                      top: 5.v,
                      bottom: 5.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodName, 
                          style: TextStyle(
                            color: Colors.black, 
                            fontWeight: FontWeight.bold, 
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Click on here for more detail"
                              .tr, 
                          style: TextStyle(
                            color: const Color.fromARGB(
                                255, 36, 36, 36), 
                            fontWeight: FontWeight.normal, 
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStackSection(BuildContext context) {
    return SizedBox(
      height: 250.v,
      width: 352.h,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 180.v,
              width: 352.h,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.img2479e1d491b49f2,
                    height: 180.v,
                    width: 352.h,
                    radius: BorderRadius.circular(
                      0.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 25.h,
                        top: 25.v,
                        right: 214.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgArrowLeftWhite,
                            height: 35.v,
                            width: 37.h,
                            onTap: () {
                              onTapImgArrowleftone(context);
                            },
                          ),
                          SizedBox(width: 600.v),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              tag?.tr ?? 'Default Tag',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.bold, 
                                fontSize: 32,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          CustomImageView(
            // imagePath: ImageConstant.imgRectangle13,
            imagePath: 'assets/imageFruit/' + (tag?.tr ?? 'apple') + '.jpg',
            height: 175.adaptSize,
            width: 175.adaptSize,
            radius: BorderRadius.circular(
              20.h,
            ),
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: 35.h),
          )
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapImgArrowleftone(BuildContext context) {
    // NavigatorService.goBack();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              cam.CameraView()),
    );
  }

  onTapBtnDetailFood(String foodName, BuildContext context) {
    if (foodName.isNotEmpty) {
      NavigatorService.pushNamed(
        AppRoutes.detailfoodScreen,
        arguments: {'foodName': foodName, 'ingredienttemp': tag.toString()},
      );
    } else {
      print("No results to pass.");
    }
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return Opacity(
      opacity: 0.7, 
      child: PopupMenuButton<String>(
        itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                    value: 'home',
                    child: ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Home'),
                    ),
                ),
                PopupMenuItem<String>(
                    value: 'favorites',
                    child: ListTile(
                        leading: Icon(Icons.star),
                        title: Text('Favorites'),
                    ),
                ),
                PopupMenuItem<String>(
                    value: 'profile',
                    child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Profile'),
                    ),
                ),
            ];
        },
        onSelected: (String value) {
            if (value == 'home') {
                NavigatorService.pushNamed(AppRoutes.homeScreen);
            } else if (value == 'favorites') {
                NavigatorService.pushNamed(AppRoutes.favoriteScreen);
            } else if (value == 'profile') {
                NavigatorService.pushNamed(AppRoutes.profileScreen);
            }
        },
        child: CustomFloatingButton(
            height: 30,
            width: 30,
            backgroundColor: appTheme.greenA400,
            child: Icon(Icons.menu),
        ),
      ),
    );
  }
}
