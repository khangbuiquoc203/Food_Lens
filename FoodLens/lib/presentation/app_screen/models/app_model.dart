import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [app_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AppModel extends Equatable {
  AppModel();

  AppModel copyWith() {
    return AppModel();
  }

  @override
  List<Object?> get props => [];
}
