import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../core/utils/global_variables.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'bloc/usernamenew_bloc.dart';
import 'models/usernamenew_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsernamenewScreen extends StatelessWidget {
  UsernamenewScreen({Key? key}) : super(key: key);
  final TextEditingController _usernameController = TextEditingController();

  static Widget builder(BuildContext context) {
    return BlocProvider<UsernamenewBloc>(
      create: (context) => UsernamenewBloc(UsernamenewState(
        usernamenewModelObj: UsernamenewModel(),
      ))
        ..add(UsernamenewInitialEvent()),
      child: UsernamenewScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsernamenewBloc, UsernamenewState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray300,
            appBar: _buildAppbar(context),
            body: Container(
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(vertical: 2.v),
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 6.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 3.v,
                    ),
                    child: Text(
                      "Enter Your New Username",
                      style: CustomTextStyles.bodyMediumBlack900,
                    ),
                  ),
                  SizedBox(height: 20.v),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'New Username',
                      border: OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (newUsername) {
                      onTapSave(context, newUsername);
                    },
                  ),
                  SizedBox(height: 20.v),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     CustomImageView(
                  //       imagePath: ImageConstant.imgClose,
                  //       height: 16.v,
                  //       width: 18.h,
                  //       margin: EdgeInsets.only(top: 2.v),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
        text: "lbl_username_new".tr,
        margin: EdgeInsets.only(left: 12.h),
      ),
      actions: [
        AppbarSubtitleOne(
          text: "lbl_save".tr,
          margin: EdgeInsets.fromLTRB(8.h, 25.v, 8.h, 9.v),
          onTap: () {
            onTapSave(context, _usernameController.text);
          },
        )
      ],
      styleType: Style.bgFill,
    );
  }

  void onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  // Hàm thực hiện lưu tên mới vào cơ sở dữ liệu SQLite
  Future<bool> saveNewUsernameToDatabase(String email, String newUsername) async {
    final url = Uri.parse('$BASE_URL/user/update_username');
    final headers = {'Content-Type': 'application/json'};
    final body = {'email': email, 'newUsername': newUsername};

    try {
      final response = await http.post(url, headers: headers, body: json.encode(body));
      if (response.statusCode == 200) {
        print('Username updated successfully');
        return true;
      } else {
        print('Failed to update username: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error updating username: $e');
      return false;
    }
  }

  Future<void> onTapSave(BuildContext context, String newUsername) async {

    if (await saveNewUsernameToDatabase(global_email, newUsername)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.green[50],
          title: Text(
            "Notification",
            style: TextStyle(color: Colors.green[800], fontSize: 24),
          ),
          content: Text(
            "Successfully renamed!",
            style: TextStyle(color: Colors.green[800], fontSize: 17),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                global_username = newUsername;
                // Sau khi lưu xong, điều hướng người dùng đến màn hình accountsetupScreen
                NavigatorService.pushNamed(AppRoutes.accountsetupScreen);
              },
              child: Text(
                "OK",
                style: TextStyle(color: Colors.orange, fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.red[50],
          title: Text(
            "Error!",
            style: TextStyle(color: Colors.red[600], fontSize: 24),
          ),
          content: Text(
            "Failed! Please try again.",
            style: TextStyle(color: Colors.red[600], fontSize: 17),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Try again!",
                style: TextStyle(color: Colors.orange, fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }
  }
}
