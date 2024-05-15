part of 'socialmediaaccountnew_bloc.dart';

/// Represents the state of Socialmediaaccountnew in the application.

// ignore_for_file: must_be_immutable
class SocialmediaaccountnewState extends Equatable {
  SocialmediaaccountnewState({this.socialmediaaccountnewModelObj});

  SocialmediaaccountnewModel? socialmediaaccountnewModelObj;

  @override
  List<Object?> get props => [socialmediaaccountnewModelObj];
  SocialmediaaccountnewState copyWith(
      {SocialmediaaccountnewModel? socialmediaaccountnewModelObj}) {
    return SocialmediaaccountnewState(
      socialmediaaccountnewModelObj:
          socialmediaaccountnewModelObj ?? this.socialmediaaccountnewModelObj,
    );
  }
}
