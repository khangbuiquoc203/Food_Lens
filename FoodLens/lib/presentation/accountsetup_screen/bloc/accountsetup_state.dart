part of 'accountsetup_bloc.dart';

/// Represents the state of Accountsetup in the application.

// ignore_for_file: must_be_immutable
class AccountsetupState extends Equatable {
  AccountsetupState({this.accountsetupModelObj});

  AccountsetupModel? accountsetupModelObj;

  @override
  List<Object?> get props => [accountsetupModelObj];
  AccountsetupState copyWith({AccountsetupModel? accountsetupModelObj}) {
    return AccountsetupState(
      accountsetupModelObj: accountsetupModelObj ?? this.accountsetupModelObj,
    );
  }
}
