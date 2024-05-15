part of 'appinformation_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Appinformation widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class AppinformationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Appinformation widget is first created.
class AppinformationInitialEvent extends AppinformationEvent {
  @override
  List<Object?> get props => [];
}
