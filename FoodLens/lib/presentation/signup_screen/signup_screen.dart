import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tqk_lens/core/utils/global_variables.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart'; // ignore_for_file: must_be_immutable


class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool acceptedPolicy = true;

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (context) => SignupBloc(SignupState(
        signupModelObj: SignupModel(),
      ))
        ..add(SignupInitialEvent()),
      child: SignupScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
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
                        _buildStacksignup(context),
                        SizedBox(height: 18.v),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 36.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.h,
                            vertical: 13.v,
                          ),
                          decoration: AppDecoration.outlineBlack9003.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildEmail(context),
                              SizedBox(height: 6.v),
                              _buildPassword(context),
                              SizedBox(height: 6.v),
                              _buildConfirmpassword(context),
                              SizedBox(height: 2.v),
                              CheckboxListTile(
                                title: Text(
                                  "msg_i_accept_the_policy".tr,
                                  style: theme.textTheme.labelLarge,
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: acceptedPolicy,
                                onChanged: (bool? value) {
                                  if (value != null) {
                                    acceptedPolicy = true;
                                  }
                                },
                              ),
                              SizedBox(height: 3.v),
                              _buildLogin(context, state),
                              SizedBox(height: 5.v),
                              SizedBox(
                                height: 18.v,
                                width: 237.h,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 237.h,
                                        child: Divider(),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "lbl_or".tr,
                                        style: theme.textTheme.labelLarge,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 9.v),
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
                        SizedBox(height: 10.v),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "msg_alreay_have_account2".tr,
                                style: theme.textTheme.labelLarge,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    onTapTxtAlreayhaveaccount(context);
                                  },
                              ),
                              TextSpan(
                                text: "lbl_login2".tr,
                                style: CustomTextStyles.labelLargeCyan400_1,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    onTapTxtAlreayhaveaccount(context);
                                  },
                              )
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 7.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgB2c474e61edb4162x360,
                          height: 162.v,
                          width: 360.h,
                        ),
                        SizedBox(height: 8.v)
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
  Widget _buildStacksignup(BuildContext context) {
    return SizedBox(
      height: 270.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "lbl_sign_up".tr,
              style: theme.textTheme.displayLarge,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgFreshFruitsAnd251x360,
            height: 251.v,
            width: 360.h,
            alignment: Alignment.topCenter,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
      selector: (state) => state.emailController,
      builder: (context, emailController) {
        return CustomFloatingTextField(
          controller: emailController,
          labelText: "lbl_email_address".tr,
          labelStyle: theme.textTheme.titleSmall!,
          hintText: "lbl_email_address".tr,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
      selector: (state) => state.passwordController,
      builder: (context, passwordController) {
        return CustomFloatingTextField(
          controller: passwordController,
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
  Widget _buildConfirmpassword(BuildContext context) {
    return BlocSelector<SignupBloc, SignupState, TextEditingController?>(
      selector: (state) => state.confirmpasswordController,
      builder: (context, confirmpasswordController) {
        return CustomFloatingTextField(
          controller: confirmpasswordController,
          labelText: "msg_confirm_password".tr,
          labelStyle: theme.textTheme.titleSmall!,
          hintText: "msg_confirm_password".tr,
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
  Widget _buildLogin(BuildContext context, SignupState state) {
    return CustomElevatedButton(
      width: 162.h,
      text: "lbl_log_in2".tr,
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientLightBlueToCyanDecoration,
      buttonTextStyle: theme.textTheme.titleLarge!,
      onPressed: () async {
        // Kiểm tra xem người dùng đã chấp nhận điều khoản chưa
        if (!acceptedPolicy) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.green[50],
              title: Text(
                "Notification",
                style: TextStyle(color: Colors.green[800], fontSize: 24),
              ),
              content: Text(
                "You have not agreed to the terms",
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
          return;
        }

        if (_formKey.currentState!.validate()) {
          String email = state.emailController!.text;
          String password = state.passwordController!.text;

          bool isValidEmail = await checkExternalEmailValidity(email);
          // bool isValidEmail = true;

          if (isValidEmail) {
            // Email hợp lệ
            final response = await http.get(Uri.parse('$BASE_URL/user?email=$email'));

            if (response.statusCode == 200) {
              // Email đã tồn tại
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.green[50],
                  title: Text(
                    "Notification",
                    style: TextStyle(color: Colors.green[800], fontSize: 24),
                  ),
                  content: Text(
                    "Email already exists. Please try another email!",
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
            } else {
              final response = await http.post(
                  Uri.parse('$BASE_URL/user/register'),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    'email': email,
                    'password': password,
                  }),
                );
              if (response.statusCode == 201) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.green[50],
                    title: Text(
                      "Notification",
                      style: TextStyle(color: Colors.green[800], fontSize: 24),
                    ),
                    content: Text(
                      "Successfully registered!",
                      style: TextStyle(color: Colors.green[800], fontSize: 17),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          fetchAndSetGlobalUsername(email);
                          onTapBtnLogin(context);
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
                // Lỗi đăng ký, xử lý phản hồi lỗi
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.red[50],
                    title: Text(
                      "Error!",
                      style: TextStyle(color: Colors.red[800], fontSize: 24),
                    ),
                    content: Text(
                      "Registration failed. Please try again.",
                      style: TextStyle(color: Colors.red[800], fontSize: 17),
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
          } else {
            // Email không hợp lệ bên ngoài
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.green[50],
                title: Text(
                  "Notification",
                  style: TextStyle(color: Colors.green[800], fontSize: 24),
                ),
                content: Text(
                  "Invalid email. Please try another email!",
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
      },
    );
  }

  void onTapBtnLogin(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.homeScreen);
  }

  Future<bool> checkExternalEmailValidity(String email) async {
    String apiKey = keyMain_hunter;
    String apiUrl = apiMail_hunter;

    Uri uri = Uri.parse('$apiUrl?email=$email&api_key=$apiKey');

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic>? json = jsonDecode(response.body);
        if (json != null && json['data'] != null) {
          String status = json['data']['status'];
          String result = json['data']['result'];

          if (status == 'valid' && result == 'deliverable') {
            return true;
          } else {
            return false;
          }
        } else {
          print('Error: Invalid JSON structure');
          return false;
        }
      } else {
        print('Error: ${response.reasonPhrase}');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }

  void onTapTxtAlreayhaveaccount(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.loginScreen);
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
