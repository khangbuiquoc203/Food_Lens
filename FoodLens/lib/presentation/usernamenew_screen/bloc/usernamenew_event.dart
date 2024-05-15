part of 'usernamenew_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Usernamenew widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class UsernamenewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Usernamenew widget is first created.
class UsernamenewInitialEvent extends UsernamenewEvent {
  @override
  List<Object?> get props => [];
}
