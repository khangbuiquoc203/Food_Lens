part of 'terms_of_service_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///TermsOfService widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class TermsOfServiceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the TermsOfService widget is first created.
class TermsOfServiceInitialEvent extends TermsOfServiceEvent {
  @override
  List<Object?> get props => [];
}
