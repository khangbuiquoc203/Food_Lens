import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/socialmediaaccountnew_model.dart';
part 'socialmediaaccountnew_event.dart';
part 'socialmediaaccountnew_state.dart';

/// A bloc that manages the state of a Socialmediaaccountnew according to the event that is dispatched to it.
class SocialmediaaccountnewBloc
    extends Bloc<SocialmediaaccountnewEvent, SocialmediaaccountnewState> {
  SocialmediaaccountnewBloc(SocialmediaaccountnewState initialState)
      : super(initialState) {
    on<SocialmediaaccountnewInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SocialmediaaccountnewInitialEvent event,
    Emitter<SocialmediaaccountnewState> emit,
  ) async {}
}
