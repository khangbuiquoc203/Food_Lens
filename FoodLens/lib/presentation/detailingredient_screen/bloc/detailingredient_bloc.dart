import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/detailingredient_model.dart';
part 'detailingredient_event.dart';
part 'detailingredient_state.dart';

/// A bloc that manages the state of a Detailingredient according to the event that is dispatched to it.
class DetailingredientBloc
    extends Bloc<DetailingredientEvent, DetailingredientState> {
  DetailingredientBloc(DetailingredientState initialState)
      : super(initialState) {
    on<DetailingredientInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DetailingredientInitialEvent event,
    Emitter<DetailingredientState> emit,
  ) async {}
}
