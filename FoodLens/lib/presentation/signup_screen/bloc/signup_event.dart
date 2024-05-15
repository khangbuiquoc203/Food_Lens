part of 'signup_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Signup widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Signup widget is first created.
class SignupInitialEvent extends SignupEvent {
  @override
  List<Object?> get props => [];
}
