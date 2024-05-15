part of 'detailfood_bloc.dart';

// ignore: must_be_immutable
class DetailfoodState extends Equatable {
  DetailfoodState({this.detailfoodModelObj});
  DetailfoodModel? detailfoodModelObj;
  @override
  List<Object?> get props => [detailfoodModelObj];
  DetailfoodState copyWith({DetailfoodModel? detailfoodModelObj}) {
    return DetailfoodState(
      detailfoodModelObj: detailfoodModelObj ?? this.detailfoodModelObj,
    );
  }
}
