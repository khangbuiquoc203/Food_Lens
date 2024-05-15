import 'package:flutter/material.dart';
import 'package:tqk_lens/core/utils/global_variables.dart';
import 'package:tqk_lens/widgets/custom_floating_button.dart';
import '../../core/app_export.dart';
import 'bloc/detailfood_bloc.dart';
import 'models/detailfood_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailfoodScreen extends StatelessWidget {
  final String? foodName;
  final String? ingredienttemp;

  const DetailfoodScreen({Key? key, required this.foodName, required this.ingredienttemp}) : super(key: key);
  static Widget builder(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic> ??
            {};
    final String foodName = args['foodName'] as String? ?? '';
    final String ingredienttemp = args['ingredienttemp'] as String? ?? '';
    return BlocProvider<DetailfoodBloc>(
      create: (context) => DetailfoodBloc(DetailfoodState(
        detailfoodModelObj: DetailfoodModel(),
      ))
        ..add(DetailfoodInitialEvent()),
      child: DetailfoodScreen(foodName: foodName, ingredienttemp: ingredienttemp),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> extractFoodDetails(List<dynamic> jsonData) {
      return jsonData.map((item) => {
        'foodName': item['foodName'] ?? '',
        'foodDetail': item['foodDetail'] ?? '',
        'foodIngredient': item['foodIngredient'] ?? '',
        'foodProcessing': item['foodProcessing'] ?? ''
      }).toList();
    }

    Future<List<Map<String, dynamic>>> fetchFoodDetails(String foodName) async {
      if (foodName == null) {
        return [{'Error': 'Invalid food name'}];
      }

      var url = Uri.parse('$BASE_URL/food/details?foodName=$foodName');
      try {
        var response = await http.get(url);
        if (response.statusCode == 200) {
          List<dynamic> jsonData = json.decode(response.body);
          return extractFoodDetails(jsonData);
        } else {
          print("Food details: No food found");
          return [{'Error': 'No food found'}];
        }
      } catch (e) {
        print('Error fetching food details: $e');
        return [{'Error': 'Error retrieving data'}];
      }
    }

    TextStyle customTextStyle = TextStyle(
      color: Color.fromARGB(255, 219, 204, 204), 
      fontSize: 15.0, 
      fontWeight: FontWeight.normal, 
      fontStyle: FontStyle.italic, 
    );

    return BlocBuilder<DetailfoodBloc, DetailfoodState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: SingleChildScrollView(
              // Thêm widget này để cho phép cuộn
              child: Container(
                margin: EdgeInsets.only(),
                decoration: AppDecoration.fillBlack,
                child: Column(
                  children: [
                    _buildStackArrowBackI(context),
                    SizedBox(height: 19.v),
                    _buildRowSignalOne(context),
                    SizedBox(height: 17.v),
                    FutureBuilder<List<Map<String, dynamic>>>(
                      future: fetchFoodDetails(foodName.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else if (snapshot.data == null ||
                            snapshot.data!.isEmpty) {
                          return Text("No data available");
                        } else {
                          return Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 304.h,
                                  margin:
                                      EdgeInsets.only(left: 32.h, right: 16.h, bottom: 22.h),
                                  child: Text(
                                    snapshot.data![0]['foodDetail']!,
                                    maxLines: 100,
                                    overflow: TextOverflow.ellipsis,
                                    style: customTextStyle,
                                  ),
                                ),
                              ),
                              buildSectionTitle(context, '1. Ingredient'),
                              SizedBox(height: 10.v),
                              Container(
                                width: 304.h,
                                margin:
                                    EdgeInsets.only(left: 32.h, right: 16.h, top: 0.1.h, bottom: 22.h),
                                child: Text(
                                  formatList(snapshot.data![0]['foodIngredient']!),
                                  maxLines: 100,
                                  overflow: TextOverflow.ellipsis,
                                  style: customTextStyle,
                                ),
                              ),
                              buildSectionTitle(context, '2. Processing'),
                              SizedBox(height: 10.v),
                              Container(
                                width: 304.h,
                                margin:
                                    EdgeInsets.only(left: 32.h, right: 16.h, top: 0.1.h, bottom: 22.h),
                                child: Text(
                                  formatList(snapshot.data![0]['foodProcessing']!),
                                  maxLines: 100,
                                  overflow: TextOverflow.ellipsis,
                                  style: customTextStyle,
                                ),
                              ),
                              SizedBox(height: 40.v)
                            ],
                          );
                        }
                      },
                    ),
                    SizedBox(height: 40.v)
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

  Widget buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft, 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 2.0),
        child: Text(
          title,
          textAlign: TextAlign.left, 
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 90, 175, 93),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackArrowBackI(BuildContext context) {
    return SizedBox(
      height: 212.v,
      width: 352.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomImageView(
            imagePath: 'assets/imageFood/' +
                (foodName ?? 'Apple and walnut salad') +
                '.jpg',
            height: 212.v,
            width: 352.h,
            radius: BorderRadius.vertical(
              bottom: Radius.circular(30.h),
            ),
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeftWhite,
            height: 35.v,
            width: 37.h,
            margin: EdgeInsets.only(right: 300.v, top: 20.v),
            onTap: () {
              onTapImgArrowleftone(context);
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRowSignalOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<int>(
            future: checkFavorite(), 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Loader while waiting
              }
              bool isFavorite = snapshot.data == 200;
              bool dataExists = snapshot.data == 409;
              return GestureDetector(
                onTap: () async {
                  if (isFavorite) {
                    deleteFavorite();
                  } else {
                    if (dataExists) {
                      deleteFavorite();  
                    }
                    addFavorite();
                  }
                  refreshPage(context);  
                },
                child: CustomImageView(
                  imagePath: isFavorite ? ImageConstant.imgStar : ImageConstant.imgFavo,
                  height: 25.adaptSize,
                  width: 25.adaptSize,
                  margin: EdgeInsets.only(top: 2.v, bottom: 3.v),
                ),
              );
            },
          ),
          Container(
            margin: EdgeInsets.only(left: 20.h),
            decoration: AppDecoration.outlineBlack,
            child: Text(
              foodName.toString(),  
              style: TextStyle(
                fontSize: 16,
                color: Colors.lightGreenAccent[100],
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<String> fetchIngredientName(String tag) async {
    var url = Uri.parse('$BASE_URL/get_ingredient_name_by_food?foodName=$tag'); 
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['nameIngredient']; 
    } else {
      throw Exception('Failed to load ingredient name');
    }
  }

  onTapImgArrowleftone(BuildContext context) async {
    // NavigatorService.goBack();
    // var ingredientName = await fetchIngredientName(foodName!);
    // if (ingredienttemp != null)

    // NavigatorService.pushNamed(
    //     AppRoutes.detailingredientScreen,
    //     arguments: {'tag': ingredienttemp},
    //   );
    // else:
    //   NavigatorService.pushNamed(
    //     AppRoutes.favoriteScreen
    //   );
    if (ingredienttemp != '') {
  NavigatorService.pushNamed(
    AppRoutes.detailingredientScreen,
    arguments: {'tag': ingredienttemp},
  );
} else {
  NavigatorService.pushNamed(
    AppRoutes.favoriteScreen,
  );
}

  }

  void addFavorite() async {
    try {
      var url = Uri.parse('$BASE_URL/add_favorite');
      
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': global_email,
          'foodName': foodName,
        }),
      );

      if (response.statusCode == 200) {
        print('Favorite added successfully');
      } else {
        print('Failed to add favorite: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<int> checkFavorite() async {
    var url = Uri.parse('$BASE_URL/check_favorite');

    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': global_email,
          'foodName': foodName,
        }),
      );

      return response.statusCode;
    } catch (e) {
      print('Error: $e');
      return 500; 
    }
  }


  void deleteFavorite() async {
    try {
      var url = Uri.parse('$BASE_URL/delete_favorite');

      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': global_email,
          'foodName': foodName,
        }),
      );

      if (response.statusCode == 200) {
        print('Favorite deleted successfully');
      } else if (response.statusCode == 203) {
        print('Favorite does not exist');
      } else if (response.statusCode == 404) {
        print('User or food not found');
      } else {
        print('Failed to delete favorite: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void refreshPage(BuildContext context) {
    NavigatorService.pushNamed(
        AppRoutes.detailfoodScreen,
        arguments: {'foodName': foodName, 'ingredienttemp': ingredienttemp},
      );
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

  String formatList(String? input) {
    if (input == null) return '';
    return input.replaceAll('**', '\n');
  }

}