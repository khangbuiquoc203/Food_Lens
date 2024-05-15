part of 'app_bloc.dart';

/// Represents the state of App in the application.

// ignore_for_file: must_be_immutable
class AppState extends Equatable {
  AppState({this.appModelObj});

  AppModel? appModelObj;

  @override
  List<Object?> get props => [appModelObj];
  AppState copyWith({AppModel? appModelObj}) {
    return AppState(
      appModelObj: appModelObj ?? this.appModelObj,
    );
  }
}
