part of 'terms_of_service_bloc.dart';

/// Represents the state of TermsOfService in the application.

// ignore_for_file: must_be_immutable
class TermsOfServiceState extends Equatable {
  TermsOfServiceState({this.termsOfServiceModelObj});

  TermsOfServiceModel? termsOfServiceModelObj;

  @override
  List<Object?> get props => [termsOfServiceModelObj];
  TermsOfServiceState copyWith({TermsOfServiceModel? termsOfServiceModelObj}) {
    return TermsOfServiceState(
      termsOfServiceModelObj:
          termsOfServiceModelObj ?? this.termsOfServiceModelObj,
    );
  }
}
