part of 'forgot_pwd_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ForgotPwd widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class ForgotPwdEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the ForgotPwd widget is first created.
class ForgotPwdInitialEvent extends ForgotPwdEvent {
  @override
  List<Object?> get props => [];
}
