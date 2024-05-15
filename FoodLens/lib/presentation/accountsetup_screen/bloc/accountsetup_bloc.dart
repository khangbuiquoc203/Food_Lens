import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/accountsetup_model.dart';
part 'accountsetup_event.dart';
part 'accountsetup_state.dart';

/// A bloc that manages the state of a Accountsetup according to the event that is dispatched to it.
class AccountsetupBloc extends Bloc<AccountsetupEvent, AccountsetupState> {
  AccountsetupBloc(AccountsetupState initialState) : super(initialState) {
    on<AccountsetupInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AccountsetupInitialEvent event,
    Emitter<AccountsetupState> emit,
  ) async {}
}
