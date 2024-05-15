import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/favorite_model.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

/// A bloc that manages the state of a Favorite according to the event that is dispatched to it.
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(FavoriteState initialState) : super(initialState) {
    on<FavoriteInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FavoriteInitialEvent event,
    Emitter<FavoriteState> emit,
  ) async {}
}
