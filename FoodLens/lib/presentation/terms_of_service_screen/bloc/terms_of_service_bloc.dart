import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/terms_of_service_model.dart';
part 'terms_of_service_event.dart';
part 'terms_of_service_state.dart';

/// A bloc that manages the state of a TermsOfService according to the event that is dispatched to it.
class TermsOfServiceBloc
    extends Bloc<TermsOfServiceEvent, TermsOfServiceState> {
  TermsOfServiceBloc(TermsOfServiceState initialState) : super(initialState) {
    on<TermsOfServiceInitialEvent>(_onInitialize);
  }

  _onInitialize(
    TermsOfServiceInitialEvent event,
    Emitter<TermsOfServiceState> emit,
  ) async {}
}
