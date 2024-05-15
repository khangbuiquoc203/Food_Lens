part of 'appinformation_bloc.dart';

/// Represents the state of Appinformation in the application.

// ignore_for_file: must_be_immutable
class AppinformationState extends Equatable {
  AppinformationState({this.appinformationModelObj});

  AppinformationModel? appinformationModelObj;

  @override
  List<Object?> get props => [appinformationModelObj];
  AppinformationState copyWith({AppinformationModel? appinformationModelObj}) {
    return AppinformationState(
      appinformationModelObj:
          appinformationModelObj ?? this.appinformationModelObj,
    );
  }
}
