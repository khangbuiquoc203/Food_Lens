part of 'checkphone_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Checkphone widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class CheckphoneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Checkphone widget is first created.
class CheckphoneInitialEvent extends CheckphoneEvent {
  @override
  List<Object?> get props => [];
}
