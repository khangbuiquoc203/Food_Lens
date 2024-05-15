part of 'phonenew_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Phonenew widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class PhonenewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Phonenew widget is first created.
class PhonenewInitialEvent extends PhonenewEvent {
  @override
  List<Object?> get props => [];
}
