import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/app_model.dart';
part 'app_event.dart';
part 'app_state.dart';

/// A bloc that manages the state of a App according to the event that is dispatched to it.
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(AppState initialState) : super(initialState) {
    on<AppInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AppInitialEvent event,
    Emitter<AppState> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.loginScreen,
      );
    });
  }
}
