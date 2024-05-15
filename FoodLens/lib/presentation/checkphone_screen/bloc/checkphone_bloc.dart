import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/checkphone_model.dart';
part 'checkphone_event.dart';
part 'checkphone_state.dart';

/// A bloc that manages the state of a Checkphone according to the event that is dispatched to it.
class CheckphoneBloc extends Bloc<CheckphoneEvent, CheckphoneState> {
  CheckphoneBloc(CheckphoneState initialState) : super(initialState) {
    on<CheckphoneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    CheckphoneInitialEvent event,
    Emitter<CheckphoneState> emit,
  ) async {}
}
