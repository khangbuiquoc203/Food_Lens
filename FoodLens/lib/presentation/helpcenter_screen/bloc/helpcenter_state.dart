part of 'helpcenter_bloc.dart';

/// Represents the state of Helpcenter in the application.

// ignore_for_file: must_be_immutable
class HelpcenterState extends Equatable {
  HelpcenterState({this.messengertqklenController, this.helpcenterModelObj});

  TextEditingController? messengertqklenController;

  HelpcenterModel? helpcenterModelObj;

  @override
  List<Object?> get props => [messengertqklenController, helpcenterModelObj];
  HelpcenterState copyWith({
    TextEditingController? messengertqklenController,
    HelpcenterModel? helpcenterModelObj,
  }) {
    return HelpcenterState(
      messengertqklenController:
          messengertqklenController ?? this.messengertqklenController,
      helpcenterModelObj: helpcenterModelObj ?? this.helpcenterModelObj,
    );
  }
}
