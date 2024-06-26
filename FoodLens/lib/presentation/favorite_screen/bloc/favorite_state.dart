part of 'favorite_bloc.dart';

/// Represents the state of Favorite in the application.

// ignore_for_file: must_be_immutable
class FavoriteState extends Equatable {
  FavoriteState({this.favoriteModelObj});

  FavoriteModel? favoriteModelObj;

  @override
  List<Object?> get props => [favoriteModelObj];
  FavoriteState copyWith({FavoriteModel? favoriteModelObj}) {
    return FavoriteState(
      favoriteModelObj: favoriteModelObj ?? this.favoriteModelObj,
    );
  }
}
