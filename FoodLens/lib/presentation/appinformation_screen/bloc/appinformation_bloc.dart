import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/appinformation_model.dart';
part 'appinformation_event.dart';
part 'appinformation_state.dart';

/// A bloc that manages the state of a Appinformation according to the event that is dispatched to it.
class AppinformationBloc
    extends Bloc<AppinformationEvent, AppinformationState> {
  AppinformationBloc(AppinformationState initialState) : super(initialState) {
    on<AppinformationInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AppinformationInitialEvent event,
    Emitter<AppinformationState> emit,
  ) async {}
}
