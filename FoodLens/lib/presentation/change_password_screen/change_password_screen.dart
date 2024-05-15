import 'package:flutter/material.dart';
import 'package:tqk_lens/core/utils/global_variables.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import 'bloc/change_password_bloc.dart';
import 'models/change_password_model.dart'; // ignore_for_file: must_be_immutable
import 'dart:convert';
import 'package:http/http.dart' as http;


class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ChangePasswordBloc>(
      create: (context) => ChangePasswordBloc(ChangePasswordState(
        changePasswordModelObj: ChangePasswordModel(),
      ))
        ..add(ChangePasswordInitialEvent()),
      child: ChangePasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SizedBox(
                height: SizeUtils.height,
                child: Form(
                  key: _formKey,
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 8.v),
                    child: Column(
                      children: [
                        Spacer(),
                        CustomImageView(
                          imagePath: ImageConstant.imgArrowLeft,
                          height: 35.v,
                          width: 37.h,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 20.h),
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.accountsetupScreen);
                            // NavigatorService.pushNamed(AppRoutes.accountsetupScreen);
                          },
                        ),
                        SizedBox(height: 18.v),
                        Text(
                          "lbl_change_password".tr,
                          style: theme.textTheme.displayMedium,
                        ),
                        SizedBox(height: 8.v),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 36.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.h,
                            vertical: 13.v,
                          ),
                          decoration: AppDecoration.outlineBlack.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildPasswordField(context),
                              SizedBox(height: 6.v),
                              _buildNewPasswordField(context),
                              SizedBox(height: 6.v),
                              _buildConfirmNewPasswordField(context),
                              SizedBox(height: 24.v),
                              _buildSubmitButton(context, state),
                              SizedBox(height: 6.v)
                            ],
                          ),
                        ),
                        SizedBox(height: 92.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgB2c474e61edb4,
                          height: 162.v,
                          width: 360.h,
                        )
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
  Widget _buildPasswordField(BuildContext context) {
    return BlocSelector<ChangePasswordBloc, ChangePasswordState,
        TextEditingController?>(
      selector: (state) => state.passwordFieldController,
      builder: (context, passwordFieldController) {
        return CustomFloatingTextField(
          controller: passwordFieldController,
          labelText: "lbl_password".tr,
          labelStyle: theme.textTheme.titleSmall!,
          hintText: "lbl_password".tr,
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildNewPasswordField(BuildContext context) {
    return BlocSelector<ChangePasswordBloc, ChangePasswordState,
        TextEditingController?>(
      selector: (state) => state.newPasswordFieldController,
      builder: (context, newPasswordFieldController) {
        return CustomFloatingTextField(
          controller: newPasswordFieldController,
          labelText: "lbl_new_password".tr,
          labelStyle: theme.textTheme.titleSmall!,
          hintText: "lbl_new_password".tr,
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildConfirmNewPasswordField(BuildContext context) {
    return BlocSelector<ChangePasswordBloc, ChangePasswordState,
        TextEditingController?>(
      selector: (state) => state.confirmNewPasswordFieldController,
      builder: (context, confirmNewPasswordFieldController) {
        return CustomFloatingTextField(
          controller: confirmNewPasswordFieldController,
          labelText: "msg_confirm_new_password".tr,
          labelStyle: theme.textTheme.titleSmall!,
          hintText: "msg_confirm_new_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildSubmitButton(BuildContext context, state) {
    return CustomElevatedButton(
      width: 162.h,
      text: "lbl_submit".tr,
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientLightBlueToCyanDecoration,
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          // Retrieve the old and new passwords from the text fields
          final oldPassword = state.passwordFieldController?.text ?? '';
          final newPassword = state.newPasswordFieldController?.text ?? '';
          final confirmNewPassword = state.confirmNewPasswordFieldController?.text ?? '';

          // Check if new password and confirm new password match
          if (newPassword == confirmNewPassword) {
            if (await changePasswordAPI(context, oldPassword, newPassword) == 1) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.green[50],
                  title: Text(
                    "Notification",
                    style: TextStyle(
                        color: Colors.green[800], fontSize: 24),
                  ),
                  content: Text(
                    "Password changed successfully!",
                    style: TextStyle(
                        color: Colors.green[800], fontSize: 17),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        NavigatorService.pushNamed(AppRoutes.accountsetupScreen);
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(
                            color: Colors.orange, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            } else if (await changePasswordAPI(context, oldPassword, newPassword) == 203) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.red[50],
                  title: Text(
                    "Error!",
                    style: TextStyle(
                        color: Colors.red[500], fontSize: 24),
                  ),
                  content: Text(
                    "Failed! Password is duplicated",
                    style: TextStyle(
                        color: Colors.red[500], fontSize: 17),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Try again!",
                        style: TextStyle(
                            color: Colors.orange, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            }
            else {
              // Hiển thị thông báo lỗi
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.red[50],
                  title: Text(
                    "Error!",
                    style: TextStyle(
                        color: Colors.red[600], fontSize: 24),
                  ),
                  content: Text(
                    "Failed! Password cannot be changed",
                    style: TextStyle(
                        color: Colors.red[600], fontSize: 17),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Try again!",
                        style: TextStyle(
                            color: Colors.orange, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.green[50],
                title: Text(
                  "Notification",
                  style: TextStyle(
                      color: Colors.green[800], fontSize: 24),
                ),
                content: Text(
                  "Passwords do not match. Check it please",
                  style: TextStyle(
                      color: Colors.green[800], fontSize: 17),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Try again!",
                      style: TextStyle(
                          color: Colors.orange, fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          }
        }
      },
    );
  }

  Future<int> changePasswordAPI(BuildContext context, String oldPassword, String newPassword) async {
    final email = global_email; 

    var url = Uri.parse('$BASE_URL/change_password');
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      'email': email,
      'old_password': oldPassword,
      'new_password': newPassword,
    });

    try {
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Password changed successfully');
        return 1;
      }
      else if (response.statusCode == 203) {
        print('Password is duplicated');
        return 203;
      }
      else {
        print('Failed to change password');
        return 0;
      }
    } catch (e) {
      print('An error occurred while changing password: $e');
      return 0;
    }
  }
}
