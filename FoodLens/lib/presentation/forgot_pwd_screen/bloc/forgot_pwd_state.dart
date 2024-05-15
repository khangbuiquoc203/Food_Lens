part of 'forgot_pwd_bloc.dart';

/// Represents the state of ForgotPwd in the application.

// ignore_for_file: must_be_immutable
class ForgotPwdState extends Equatable {
  ForgotPwdState({this.emailController, this.forgotPwdModelObj});

  TextEditingController? emailController;

  ForgotPwdModel? forgotPwdModelObj;

  @override
  List<Object?> get props => [emailController, forgotPwdModelObj];
  ForgotPwdState copyWith({
    TextEditingController? emailController,
    ForgotPwdModel? forgotPwdModelObj,
  }) {
    return ForgotPwdState(
      emailController: emailController ?? this.emailController,
      forgotPwdModelObj: forgotPwdModelObj ?? this.forgotPwdModelObj,
    );
  }
}
