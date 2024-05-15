import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/usernamenew_model.dart';
part 'usernamenew_event.dart';
part 'usernamenew_state.dart';

/// A bloc that manages the state of a Usernamenew according to the event that is dispatched to it.
class UsernamenewBloc extends Bloc<UsernamenewEvent, UsernamenewState> {
  UsernamenewBloc(UsernamenewState initialState) : super(initialState) {
    on<UsernamenewInitialEvent>(_onInitialize);
  }

  _onInitialize(
    UsernamenewInitialEvent event,
    Emitter<UsernamenewState> emit,
  ) async {}
}
