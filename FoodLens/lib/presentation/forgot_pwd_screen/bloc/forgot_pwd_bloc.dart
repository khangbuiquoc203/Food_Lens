import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/forgot_pwd_model.dart';
part 'forgot_pwd_event.dart';
part 'forgot_pwd_state.dart';

/// A bloc that manages the state of a ForgotPwd according to the event that is dispatched to it.
class ForgotPwdBloc extends Bloc<ForgotPwdEvent, ForgotPwdState> {
  ForgotPwdBloc(ForgotPwdState initialState) : super(initialState) {
    on<ForgotPwdInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ForgotPwdInitialEvent event,
    Emitter<ForgotPwdState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
    ));
  }
}
