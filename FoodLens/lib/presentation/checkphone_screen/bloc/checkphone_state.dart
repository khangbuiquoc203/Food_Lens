part of 'checkphone_bloc.dart';

/// Represents the state of Checkphone in the application.

// ignore_for_file: must_be_immutable
class CheckphoneState extends Equatable {
  CheckphoneState({this.checkphoneModelObj});

  CheckphoneModel? checkphoneModelObj;

  @override
  List<Object?> get props => [checkphoneModelObj];
  CheckphoneState copyWith({CheckphoneModel? checkphoneModelObj}) {
    return CheckphoneState(
      checkphoneModelObj: checkphoneModelObj ?? this.checkphoneModelObj,
    );
  }
}
