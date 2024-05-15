import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/phonenew_model.dart';
part 'phonenew_event.dart';
part 'phonenew_state.dart';

/// A bloc that manages the state of a Phonenew according to the event that is dispatched to it.
class PhonenewBloc extends Bloc<PhonenewEvent, PhonenewState> {
  PhonenewBloc(PhonenewState initialState) : super(initialState) {
    on<PhonenewInitialEvent>(_onInitialize);
  }

  _onInitialize(
    PhonenewInitialEvent event,
    Emitter<PhonenewState> emit,
  ) async {}
}
