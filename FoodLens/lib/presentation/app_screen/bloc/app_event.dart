part of 'app_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///App widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class AppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the App widget is first created.
class AppInitialEvent extends AppEvent {
  @override
  List<Object?> get props => [];
}
