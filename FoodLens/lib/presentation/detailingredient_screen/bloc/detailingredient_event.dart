part of 'detailingredient_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Detailingredient widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class DetailingredientEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Detailingredient widget is first created.
class DetailingredientInitialEvent extends DetailingredientEvent {
  @override
  List<Object?> get props => [];
}
