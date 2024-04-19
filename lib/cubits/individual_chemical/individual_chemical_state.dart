part of 'individual_chemical_cubit.dart';

sealed class IndividualChemicalState extends Equatable {
  const IndividualChemicalState();

  @override
  List<Object> get props => [];
}

final class IndividualChemicalInitial extends IndividualChemicalState {}

final class IndividualChemicalLoading extends IndividualChemicalState {}

final class IndividualChemicalSuccess extends IndividualChemicalState {}

final class IndividualChemicalFailure extends IndividualChemicalState {}
