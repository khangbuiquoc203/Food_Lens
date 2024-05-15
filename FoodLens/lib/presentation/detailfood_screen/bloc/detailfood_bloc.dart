import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/detailfood_model.dart';
part 'detailfood_event.dart';
part 'detailfood_state.dart';

/// A bloc that manages the state of a Detailfood according to the event that is dispatched to it.
class DetailfoodBloc extends Bloc<DetailfoodEvent, DetailfoodState> {
  DetailfoodBloc(DetailfoodState initialState) : super(initialState) {
    on<DetailfoodInitialEvent>(_onInitialize);
  }
  _onInitialize(
    DetailfoodInitialEvent event,
    Emitter<DetailfoodState> emit,
  ) async {}
}
