part of 'detailfood_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Detailfood widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class DetailfoodEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Detailfood widget is first created.
class DetailfoodInitialEvent extends DetailfoodEvent {
  @override
  List<Object?> get props => [];
}
