import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:tqk_lens/core/utils/global_variables.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import 'bloc/forgot_pwd_bloc.dart';
import 'models/forgot_pwd_model.dart';

// ignore_for_file: must_be_immutable
class ForgotPwdScreen extends StatelessWidget {
  ForgotPwdScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<ForgotPwdBloc>(
      create: (context) => ForgotPwdBloc(ForgotPwdState(
        forgotPwdModelObj: ForgotPwdModel(),
      ))
        ..add(ForgotPwdInitialEvent()),
      child: ForgotPwdScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPwdBloc, ForgotPwdState>(
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
                child: SizedBox(
                  height: SizeUtils.height,
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        children: [
                          _buildStackforgotpass(context),
                          SizedBox(height: 20.v),
                          _buildColumnemail(context),
                          SizedBox(height: 13.v),
                          GestureDetector(
                            onTap: () {
                              onTapTxtAlreayhaveaccount(context);
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "msg_alreay_have_account2".tr,
                                    style: theme.textTheme.labelLarge,
                                  ),
                                  TextSpan(
                                    text: "lbl_login2".tr,
                                    style: CustomTextStyles.labelLargeCyan400_1,
                                  )
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Spacer(),
                          SizedBox(height: 16.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgB2c474e61edb4162x360,
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
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildStackforgotpass(BuildContext context) {
    return SizedBox(
      height: 294.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "lbl_forgot_password".tr,
              style: theme.textTheme.displaySmall,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgFreshFruitsAnd253x360,
            height: 253.v,
            width: 360.h,
            alignment: Alignment.topCenter,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnemail(BuildContext context) {
    return BlocBuilder<ForgotPwdBloc, ForgotPwdState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(
            left: 37.h,
            right: 22.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 28.h,
            vertical: 23.v,
          ),
          decoration: AppDecoration.outlineBlack9003.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomFloatingTextField(
                controller: state.emailController,
                labelText: "lbl_email_address".tr,
                labelStyle: theme.textTheme.titleSmall!,
                hintText: "lbl_email_address".tr,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      (!isValidEmail(value, isRequired: true))) {
                    return "err_msg_please_enter_valid_email".tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                width: 162.h,
                text: "lbl_reset_password".tr,
                buttonStyle: CustomButtonStyles.none,
                decoration:
                    CustomButtonStyles.gradientLightBlueToCyanDecoration,
                buttonTextStyle: theme.textTheme.titleLarge!,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    global_email = state.emailController!.text;
                    global_newPassword = generateRandomString();

                    bool emailSent =
                        await sendNewPasswordEmail(global_email, global_newPassword);

                    // Hiển thị thông báo và chuyển hướng
                    if (emailSent) {
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
                            "The new password is sent to your mail. Check it please",
                            style: TextStyle(
                                color: Colors.green[800], fontSize: 17),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                onTapTxtAlreayhaveaccount(context);
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
                    } else {
                      // Hiển thị thông báo lỗi
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
                            "An error occurred while sending email. Please try again later.",
                            style: TextStyle(
                                color: Colors.green[800], fontSize: 17),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
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
                    }
                  }
                },
              ),
              SizedBox(height: 11.v)
            ],
          ),
        );
      },
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtAlreayhaveaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  Future<bool> sendNewPasswordEmail(String email, String newPassword) async {
    final smtpServer = gmail('lmq240203@gmail.com', appPass);

    final message = Message()
      ..from = Address('lmq240203@gmail.com', 'Confirmation Bot')
      ..recipients.add(email)
      ..subject = "Your New Password (${DateTime.now()})"
      ..html = '<html><body style="text-align: center; font-family: Tahoma, Geneva, Verdana, sans-serif;">'
          '<div style="margin:auto; border-radius: 10px; width: 300px; padding: 10px; box-shadow: 1px 1px 1px 1px rgb(174, 174, 174);">'
          '<img style="height: 150px;" src="https://static.vecteezy.com/system/resources/previews/018/930/122/non_2x/email-marketing-campaign-subscription-on-web-and-sending-email-newsletter-for-discount-or-promotion-information-businessmen-standing-next-to-email-envelope-announcing-promotion-through-megaphone-vector.jpg" alt="newsletter">'
          '<h2>Thanks for using my application 🙌</h2>'
          '<p>Now you will never miss any updates.</p><p>Thanks for your support 😍</p>'
          '<p>Your new password is: <strong>$newPassword</strong></p>'
          '</div></body></html>';

    try {
      final sendReport = await send(message, smtpServer);
      print('Email sent: ' + sendReport.toString());
      return true;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }

  String generateRandomString({int length = 12}) {
    const specialChars = '!@#%^&*()-_=+';
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();

    final upperCaseChar = chars.substring(26, 52)[random.nextInt(26)]; // Chữ hoa
    final lowerCaseChar = chars[random.nextInt(26)]; // Chữ thường
    final specialChar = specialChars[random.nextInt(specialChars.length)]; // Ký tự đặc biệt
    final randomNumber = random.nextInt(10).toString(); // Chữ số

    final randomChars = List.generate(
      length - 4, 
      (index) => chars[random.nextInt(chars.length)],
    ).join('');

    final resultChars = '$randomChars$specialChar$upperCaseChar$lowerCaseChar$randomNumber';
    final resultList = resultChars.split('')..shuffle();

    return resultList.join();
  }
}
