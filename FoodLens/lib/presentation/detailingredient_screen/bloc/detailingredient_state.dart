part of 'detailingredient_bloc.dart';

/// Represents the state of Detailingredient in the application.

// ignore_for_file: must_be_immutable
class DetailingredientState extends Equatable {
  DetailingredientState({this.detailingredientModelObj});

  DetailingredientModel? detailingredientModelObj;

  @override
  List<Object?> get props => [detailingredientModelObj];
  DetailingredientState copyWith(
      {DetailingredientModel? detailingredientModelObj}) {
    return DetailingredientState(
      detailingredientModelObj:
          detailingredientModelObj ?? this.detailingredientModelObj,
    );
  }
}
