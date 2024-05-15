part of 'signup_bloc.dart';

/// Represents the state of Signup in the application.

// ignore_for_file: must_be_immutable
class SignupState extends Equatable {
  SignupState(
      {this.emailController,
      this.passwordController,
      this.confirmpasswordController,
      this.signupModelObj});

  TextEditingController? emailController;

  TextEditingController? passwordController;

  TextEditingController? confirmpasswordController;

  SignupModel? signupModelObj;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        confirmpasswordController,
        signupModelObj
      ];
  SignupState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmpasswordController,
    SignupModel? signupModelObj,
  }) {
    return SignupState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      signupModelObj: signupModelObj ?? this.signupModelObj,
    );
  }
}
