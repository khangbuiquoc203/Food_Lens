part of 'change_password_bloc.dart';

/// Represents the state of ChangePassword in the application.

// ignore_for_file: must_be_immutable
class ChangePasswordState extends Equatable {
  ChangePasswordState(
      {this.passwordFieldController,
      this.newPasswordFieldController,
      this.confirmNewPasswordFieldController,
      this.changePasswordModelObj});

  TextEditingController? passwordFieldController;

  TextEditingController? newPasswordFieldController;

  TextEditingController? confirmNewPasswordFieldController;

  ChangePasswordModel? changePasswordModelObj;

  @override
  List<Object?> get props => [
        passwordFieldController,
        newPasswordFieldController,
        confirmNewPasswordFieldController,
        changePasswordModelObj
      ];
  ChangePasswordState copyWith({
    TextEditingController? passwordFieldController,
    TextEditingController? newPasswordFieldController,
    TextEditingController? confirmNewPasswordFieldController,
    ChangePasswordModel? changePasswordModelObj,
  }) {
    return ChangePasswordState(
      passwordFieldController:
          passwordFieldController ?? this.passwordFieldController,
      newPasswordFieldController:
          newPasswordFieldController ?? this.newPasswordFieldController,
      confirmNewPasswordFieldController: confirmNewPasswordFieldController ??
          this.confirmNewPasswordFieldController,
      changePasswordModelObj:
          changePasswordModelObj ?? this.changePasswordModelObj,
    );
  }
}
