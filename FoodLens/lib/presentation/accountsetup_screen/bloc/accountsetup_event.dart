part of 'accountsetup_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Accountsetup widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class AccountsetupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Accountsetup widget is first created.
class AccountsetupInitialEvent extends AccountsetupEvent {
  @override
  List<Object?> get props => [];
}
