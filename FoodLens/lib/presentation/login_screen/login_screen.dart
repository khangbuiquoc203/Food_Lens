import 'package:flutter/material.dart';
import 'package:tqk_lens/core/utils/global_variables.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import 'bloc/login_bloc.dart';
import 'models/login_model.dart'; // ignore_for_file: must_be_immutable
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginState(
        loginModelObj: LoginModel(),
      ))
        ..add(LoginInitialEvent()),
      child: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
              width: SizeUtils.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      children: [
                        _buildStacklogin(context),
                        SizedBox(height: 6.v),
                        _buildColumnemail(context, state),
                        SizedBox(height: 21.v),
                        GestureDetector(
                          onTap: () {
                            onTapTxtDonthaveany(context);
                          },
                          child: Text(
                            "msg_don_t_have_any_account".tr,
                            style: CustomTextStyles.labelLargeCyan400,
                          ),
                        ),
                        SizedBox(height: 12.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgB2c474e61edb4,
                          height: 162.v,
                          width: 355.h,
                        ),
                        SizedBox(height: 5.v)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildStacklogin(BuildContext context) {
    return SizedBox(
      height: 276.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "lbl_log_in".tr,
              style: theme.textTheme.displayLarge,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgFreshFruitsAnd,
            height: 249.v,
            width: 360.h,
            alignment: Alignment.topCenter,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnemail(BuildContext context, state) {
    return Container(
      width: 291.h,
      margin: EdgeInsets.symmetric(horizontal: 34.h),
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlineBlack9003.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.v),
          Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: BlocSelector<LoginBloc, LoginState, TextEditingController?>(
              selector: (state) => state.emailController,
              builder: (context, emailController) {
                return CustomFloatingTextField(
                  controller: emailController,
                  labelText: "lbl_email_address".tr,
                  labelStyle: theme.textTheme.titleSmall!,
                  hintText: "lbl_email_address".tr,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        (!isValidEmail(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_email".tr;
                    }
                    return null;
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20.v),
          Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: BlocSelector<LoginBloc, LoginState, TextEditingController?>(
              selector: (state) => state.passwordController,
              builder: (context, passwordController) {
                return CustomFloatingTextField(
                  controller: passwordController,
                  labelText: "lbl_password".tr,
                  labelStyle: theme.textTheme.titleSmall!,
                  hintText: "lbl_password".tr,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null ||
                        (!isValidPassword(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_password".tr;
                    }
                    return null;
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20.v),
          CustomElevatedButton(
            onPressed: () => _handleLogin(context, state),
            width: 162.h,
            text: "lbl_log_in2".tr,
            buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientLightBlueToCyanDecoration,
            buttonTextStyle: theme.textTheme.titleLarge!,
          ),
          SizedBox(height: 7.v),
          GestureDetector(
            onTap: () {
              onTapTxtForgotpassword(context);
            },
            child: Text(
              "msg_forgot_password".tr,
              style: CustomTextStyles.labelLargeCyan400,
            ),
          ),
          SizedBox(height: 3.v),
          SizedBox(
            height: 47.v,
            width: 237.h,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(),
                      SizedBox(height: 8.v),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgFacebook21,
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgGoogle21,
                            height: 30.adaptSize,
                            width: 30.adaptSize,
                            margin: EdgeInsets.only(left: 24.h),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "lbl_or".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Navigates to the forgotPwdScreen when the action is triggered.
  onTapTxtForgotpassword(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.forgotPwdScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  onTapTxtDonthaveany(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }

  Future<bool> updatePasswordInDatabase(String email, String newPassword) async {
    final response = await http.post(
      Uri.parse('$BASE_URL/user/update_password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'newPassword': newPassword,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  void _handleLogin(BuildContext context, state) async {
    if (_formKey.currentState!.validate()) {
      String email = state.emailController!.text;
      String password = state.passwordController!.text;

      // Kiểm tra xem email và mật khẩu có trong cơ sở dữ liệu không
      final response = await http.post(
        Uri.parse('$BASE_URL/user/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      bool passwordCheck = password == global_newPassword;
      bool emailCheck = email == global_email;

      // bool passUpdate = await updatePasswordInDatabase(global_email, global_newPassword);

      if (response.statusCode == 200 || (passwordCheck && emailCheck)) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.green[50],
            title: Text(
              "Notification",
              style: TextStyle(color: Colors.green[800], fontSize: 24),
            ),
            content: Text(
              "Logged in successfully!",
              style: TextStyle(color: Colors.green[800], fontSize: 17),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if ((emailCheck == true) && (passwordCheck == true))
                  {
                    fetchAndSetGlobalUsername(email);
                    updatePasswordInDatabase(email, password);
                    NavigatorService.pushNamed(AppRoutes.changePasswordScreen);
                  }
                  else {
                    fetchAndSetGlobalUsername(email);
                    NavigatorService.pushNamed(AppRoutes.homeScreen);
                  }
                },
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.orange, fontSize: 16),
                ),
              ),
            ],
          ),
        );
      } else {
        // Đăng nhập không thành công
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.green[50],
            title: Text(
              "Notification",
              style: TextStyle(color: Colors.green[800], fontSize: 24),
            ),
            content: Text(
              "Failed login. Please try again later.",
              style: TextStyle(color: Colors.green[800], fontSize: 17),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
    }
  }

  Future<void> fetchAndSetGlobalUsername(String email) async {
    final response = await http.get(
      Uri.parse('$BASE_URL/user/username?email=$email'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      global_username = data['userName'];
      global_email = email;
    } else {
      print("No user found with that email");
    }
  }
}
