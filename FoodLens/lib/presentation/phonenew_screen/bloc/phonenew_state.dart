part of 'phonenew_bloc.dart';

/// Represents the state of Phonenew in the application.

// ignore_for_file: must_be_immutable
class PhonenewState extends Equatable {
  PhonenewState({this.phonenewModelObj});

  PhonenewModel? phonenewModelObj;

  @override
  List<Object?> get props => [phonenewModelObj];
  PhonenewState copyWith({PhonenewModel? phonenewModelObj}) {
    return PhonenewState(
      phonenewModelObj: phonenewModelObj ?? this.phonenewModelObj,
    );
  }
}
