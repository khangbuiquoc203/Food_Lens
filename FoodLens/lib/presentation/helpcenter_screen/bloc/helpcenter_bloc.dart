import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/helpcenter_model.dart';
part 'helpcenter_event.dart';
part 'helpcenter_state.dart';

/// A bloc that manages the state of a Helpcenter according to the event that is dispatched to it.
class HelpcenterBloc extends Bloc<HelpcenterEvent, HelpcenterState> {
  HelpcenterBloc(HelpcenterState initialState) : super(initialState) {
    on<HelpcenterInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HelpcenterInitialEvent event,
    Emitter<HelpcenterState> emit,
  ) async {
    emit(state.copyWith(
      messengertqklenController: TextEditingController(),
    ));
  }
}
