part of 'usernamenew_bloc.dart';

/// Represents the state of Usernamenew in the application.

// ignore_for_file: must_be_immutable
class UsernamenewState extends Equatable {
  UsernamenewState({this.usernamenewModelObj});

  UsernamenewModel? usernamenewModelObj;

  @override
  List<Object?> get props => [usernamenewModelObj];
  UsernamenewState copyWith({UsernamenewModel? usernamenewModelObj}) {
    return UsernamenewState(
      usernamenewModelObj: usernamenewModelObj ?? this.usernamenewModelObj,
    );
  }
}
